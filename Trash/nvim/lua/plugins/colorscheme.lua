return {
    -- add dracula
    { "Mofiqul/dracula.nvim" },
    { "catppuccin/nvim" },
    { "AlexvZyl/nordic.nvim" },
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
            vim.g.rose_pine_variant = "moon"
        end,
    },

    -- Configure LazyVim to load dracula
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine-moon",
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
