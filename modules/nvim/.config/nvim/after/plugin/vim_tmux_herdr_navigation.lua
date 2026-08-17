-- Shared Ctrl-h/j/k/l mappings for Neovim splits, tmux panes, and Herdr panes.
-- Loaded after vim-tmux-navigator so these mappings are the single source of truth.

local directions = {
    h = { name = "left", tmux = "Left" },
    j = { name = "down", tmux = "Down" },
    k = { name = "up", tmux = "Up" },
    l = { name = "right", tmux = "Right" },
}

local function notify_failure(message)
    vim.notify(message, vim.log.levels.ERROR)
end

local function leave_neovim(direction)
    local herdr_pane = vim.env.HERDR_PANE_ID

    if herdr_pane and herdr_pane ~= "" then
        local herdr = vim.env.HERDR_BIN_PATH
        if not herdr or herdr == "" then
            herdr = "herdr"
        end

        local output = vim.fn.system({ herdr, "pane", "focus", "--direction", direction.name, "--pane", herdr_pane })
        if vim.v.shell_error ~= 0 then
            notify_failure("Herdr pane navigation failed: " .. vim.trim(output))
        end
    elseif vim.env.TMUX and vim.env.TMUX ~= "" then
        local command = "TmuxNavigate" .. direction.tmux
        if vim.fn.exists(":" .. command) == 2 then
            vim.cmd(command)
        else
            notify_failure(command .. " is unavailable; vim-tmux-navigator did not load")
        end
    end
end

for key, direction in pairs(directions) do
    vim.keymap.set("n", "<C-" .. key .. ">", function()
        local previous_window = vim.api.nvim_get_current_win()
        vim.cmd("wincmd " .. key)

        if vim.api.nvim_get_current_win() == previous_window then
            leave_neovim(direction)
        end
    end, {
        silent = true,
        noremap = true,
        desc = "Navigate " .. direction.name .. " (vim/tmux/herdr)",
    })
end
