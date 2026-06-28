-- Run tests from Neovim
-- TODO: create keymaps
return {
    'vim-test/vim-test',
    keys = {
        { "<leader>vt", ":TestNearest<CR>", },
        { "<leader>vT", ":TestFile<CR>", },
        { "<leader>va", ":TestSuite<CR>", },
        { "<leader>vl", ":TestLast<CR>", },
        { "<leader>vg", ":TestVisit<CR>", },
    },
}
