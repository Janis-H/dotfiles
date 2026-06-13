-- General keymaps not owned by plugins
local function opts(desc)
    return {
        noremap = true,
        desc = desc,
    }
end

-- File actions
vim.keymap.set('n', '<leader><leader>', '<cmd>w<cr>', opts('Write to file'))
vim.keymap.set('n', '<leader><cr>', '<cmd>ReloadConfig<cr>', opts('Source init.lua'))

-- File explorer (Replaced by Oil.nvim)
-- vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>', opts('open Explorer'))
-- vim.keymap.set('n', '<leader>v', '<cmd>Vex<cr>', opts('Vertical explorer'))
-- vim.keymap.set('n', '<leader>s', '<cmd>Sex<cr>', opts('Horizontal explorer'))

-- Quickfix
vim.keymap.set('n', '<leader>co', '<cmd>copen<cr>', opts('Open quickfix'))
vim.keymap.set('n', '<leader>cn', "<cmd>cnext<cr>", opts('Next quickfix item'))
vim.keymap.set('n', '<leader>cp', "<cmd>cprev<cr>", opts('Previous quickfix item'))
vim.keymap.set('n', '<leader>cq', '<cmd>ClearQuickfix<cr>', opts('Clear quickfix'))

-- Search
vim.keymap.set('n', '<leader>cl', '<cmd>ClearSearch<cr>', opts('Clear highlighted search'))

-- Yank behavior
vim.keymap.set('n', 'Y', 'y$', opts('Yank to end of line'))

-- Delete / paste behavior
vim.keymap.set("v", "<leader>d", '"_d', opts("Delete selection without yanking it"))
vim.keymap.set('v', '<leader>p', '"_dp', opts('Delete current selection, yank into void register (to avoid replacing prev yank)'))


-- System clipboard
vim.keymap.set({ 'n', 'v'}, '<leader>y', '"+y', opts('Yank into system clipboard'))
vim.keymap.set('n', '<leader>p', '<cmd>put +<cr>', opts('Paste from system keyboard below'))
vim.keymap.set('n', '<leader>P', '<cmd>-1put +<cr>', opts('Paste from system keyboard above'))
vim.keymap.set("x", '<leader>r', '"_d"+P', opts('Paste clipboard over selection') )

-- Entire file actions
vim.keymap.set('n', '<leader>Y', 'gg"+yG', opts('Yank entire file into system clipboard'))
vim.keymap.set('n', '<leader>D', 'gg"_dG', opts('Delete entire file without yanking it'))

-- Move selected lines
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", opts('Move line up'))
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", opts('Move line down'))
vim.keymap.set("v", ">", ">gv", opts("Indent right"))
vim.keymap.set("v", "<", "<gv", opts("Indent left"))


-- tmux-sessionizer
-- Ctrl-f opens the project picker
-- Alt bindings run TS_SESSION_COMMANDS by index in the active project session.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>", opts('Opens tmux-sessionizer project picker'))
vim.keymap.set(
    "n",
    "<M-1>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 0<cr>",
    opts('Runs TS_SESSION_COMMANDS[0]')
)
vim.keymap.set(
    "n",
    "<M-2>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 1<cr>",
    opts('Runs TS_SESSION_COMMANDS[1]')
)
vim.keymap.set(
    "n",
    "<M-3>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 2<cr>",
    opts('Runs TS_SESSION_COMMANDS[2]')
)
vim.keymap.set(
    "n",
    "<M-4>",
    "<cmd>silent !tmux neww tmux-sessionizer -s 3<cr>",
    opts('Runs TS_SESSION_COMMANDS[3]')
)
