-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("conform").setup({
    formatters_by_ft = {
        cpp = { "clang-format" },
        c = { "clang-format" },
    },
})

vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,n-v:blinkwait500-blinkoff250-blinkon200-Cursor/lCursor"
vim.opt.guifont = "JetBrainsMono Nerd Font"
-- Define the highlight groups
vim.api.nvim_set_hl(0, "Cursor", { fg = "#cc9900", bg = "#fff1da" })
vim.api.nvim_set_hl(0, "CursorReset", { fg = "#cc9900", bg = "#fff1da" })

-- Set backgeound color
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#181818" })
-- -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181818" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "#181818" })
-- vim.api.nvim_set_hl(0, "NormalNCFloat", { bg = "#181818" })
-- vim.api.nvim_set_hl(0, "NormalPopup", { bg = "#181818" })
-- vim.api.nvim_set_hl(0, "NormalPopupFloat", { bg = "#181818" })
-- vim.api.nvim_set_hl(0, "NormalPopupNC", { bg = "#181818" })
-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#181818", ctermbg = "none" })
