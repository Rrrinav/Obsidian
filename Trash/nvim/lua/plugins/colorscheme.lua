return {
    -- add dracula
    {
        "Mofiqul/dracula.nvim",
        opts = {
            lualine_bg_color = "#aa4755", -- default nil
        },
    },
    { "catppuccin/nvim" },
    {
        "AlexvZyl/nordic.nvim",
        opts = {
            bright_border = false,
            telescope = {
                -- Available styles: `classic`, `flat`.
                style = "classic",
            },
            ts_context = {
                dark_background = false,
            },
            on_highlight = {
                PmenuSel = { bg = "#0e005c" },
            },
        },
    },
    { "myagko/nymph", branch = "Nvim" },
    { "sainnhe/sonokai" },
    { "sainnhe/everforest" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/edge" },
    { "yashguptaz/calvera-dark.nvim" },
    { "Yazeed1s/minimal.nvim" },
    { "folke/tokyonight.nvim" },
    {
        "rose-pine/neovim",
        config = function()
            vim.g.rose_pine_variant = "main"
        end,
    },

    -- Configure LazyVim to load dracula
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "sonokai",
            "catppuccin",
            "nordic",
            "sonokai",
            "everforest",
            "tokyonight",
            "minimal",
            edge = {
                "gruvbox-material",
                "edge",
            },
        },
    },
}
