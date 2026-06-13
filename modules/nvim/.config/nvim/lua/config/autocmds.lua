-- Trim trailing whitespace before saving most files.
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Trim trailing whitespace on save",
    callback = function()
        -- ignore markdown files
        if vim.bo.filetype == "markdown" then
            return
        end

        local view = vim.fn.winsaveview()

        vim.cmd([[%s/\s\+$//e]])

        vim.fn.winrestview(view)
    end,
})
