return {
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            keywords = {
                DOUBT = { icon = " ", color = "#ff9911" },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            automatic_installation = false,
        },
    },
    {
        "folke/which-key.nvim",
        opts = {
            preset = "helix",
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "3rd/image.nvim" },
        opts = {
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },

                -- hijack_netrw_behavior = "enabled", -- Disable hijacking so Neo-tree doesn't open automatically
            },
        },
    },
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
                "NvimTreeNormal", -- NvimTree
            },
        },
    },
}
