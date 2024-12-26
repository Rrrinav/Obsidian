local M = {}

function M.setup()
    vim.o.signcolumn = "auto"
    -- current cursor config
    vim.opt.guicursor = "n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50,n-v:blinkwait500-blinkoff250-blinkon200-Cursor/lCursor"

    -- block cursor for everything
    -- vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,n-v:blinkwait500-blinkoff250-blinkon200-Cursor/lCursor"
    vim.opt.guifont = "JetBrainsMono Nerd Font"

    -- Define the highlight groups
    -- local crusor_fg = "#cc9900"
    -- local white_alt = "#fff1da"
    --
    vim.api.nvim_set_hl(0, "Cursor", { fg = white_alt, bg = "#fff1da" })
    vim.api.nvim_set_hl(0, "CursorReset", { fg = white_alt, bg = "#fff1da" })
    vim.api.nvim_set_hl(0, "lcursor", { fg = white_alt, bg = "#fff1da" })
end

return M
