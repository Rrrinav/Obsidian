-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.highlights").setup()
require("config.basic_gui").setup()

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.diagnostic.enable(false) -- Disables LSP diagnostics for the current buffer
    end,
})

require("transparent").clear_prefix("Neotree")
require("transparent").clear_prefix("WhichKey")
