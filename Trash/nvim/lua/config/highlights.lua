local M = {}

function M.setup()
    local bg_color = "#181818"

    -- General highlights
    vim.api.nvim_set_hl(0, "Normal", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NormalNCFloat", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NormalPopup", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NormalPopupFloat", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NormalPopupNC", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = bg_color })
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#aaaaaa"})

    -- Telescope highlights
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bg_color })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = bg_color })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bg_color })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = bg_color })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bg_color })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = bg_color })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg_color })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = bg_color })
end

return M
