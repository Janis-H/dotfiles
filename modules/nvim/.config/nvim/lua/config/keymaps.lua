-- General keymaps not owned by plugins
local function opts(desc)
    return {
        noremap = true,
        desc = desc,
    }
end

-- File actions
vim.keymap.set('n', '<leader><leader>', ':w<CR>', opts('Write to file'))
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', opts('Source init.lua'))

-- File explorer
vim.keymap.set('n', '<leader>e', ':Ex<CR>', opts('open Explorer'))
vim.keymap.set('n', '<leader>v', ':Vex<CR>', opts('Vertical explorer'))
vim.keymap.set('n', '<leader>s', ':Sex<CR>', opts('Horizontal explorer'))

-- Quickfix
vim.keymap.set('n', '<leader>co', '<cmd>copen<cr>', opts('Open quickfix'))
vim.keymap.set('n', '<leader>cn', "<cmd>cnext<cr>", opts('Next quickfix item'))
vim.keymap.set('n', '<leader>cp', "<cmd>cprev<cr>", opts('Previous quickfix item'))
vim.keymap.set('n', '<leader>cq', '<cmd>cexpr []<cr><cmd>cclose<cr>', opts('Clear quickfix'))

-- Search
vim.keymap.set('n', '<leader>cl', ':nohls<CR>', opts('Clear highlighted search'))

-- Yank behavior
vim.keymap.set('n', 'Y', 'y$', opts('Yank to end of line'))

-- Delete / paste behavior
vim.keymap.set("v", "<leader>d", '"_d', opts("Delete selection without yanking it"))
vim.keymap.set('v', '<leader>p', '"_dp', opts('Delete current selection, yank into void register (to avoid replacing prev yank)'))


-- System clipboard
vim.keymap.set({ 'n', 'v'}, '<leader>y', '"+y', opts('Yank into system clipboard'))
vim.keymap.set('n', '<leader>P', '"+p', opts('Past from system keyboard'))

-- Entire file actions
vim.keymap.set('n', '<leader>Y', 'gg"+yG', opts('Yank entire file into system clipboard'))
vim.keymap.set('n', '<leader>D', 'gg"_dG', opts('Delete entire file without yanking it'))

-- Move selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts('Move line up'))
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts('Move line down'))

-- tmux-sessionizer
-- Ctrl-f opens the project picker
-- Alt bindings run TS_SESSION_COMMANDS by index in the active project session.
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts('Opens tmux-sessionizer project picker'))
vim.keymap.set(
    "n", 
    "<M-1>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>",
    opts('Runs TS_SESSION_COMMANDS[0]')
)
vim.keymap.set(
    "n", 
    "<M-2>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>",
    opts('Runs TS_SESSION_COMMANDS[1]')
)
vim.keymap.set(
    "n", 
    "<M-3>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>",
    opts('Runs TS_SESSION_COMMANDS[2]')
)
vim.keymap.set(
    "n", 
    "<M-4>", 
    "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>",
    opts('Runs TS_SESSION_COMMANDS[3]')
)
