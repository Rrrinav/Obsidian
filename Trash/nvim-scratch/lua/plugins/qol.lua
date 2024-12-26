return {
    { 'echasnovski/mini.cursorword', version = '*' },
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
    -- Timerly
    { "nvzone/volt",                 { "nvzone/timerly", cmd = "TimerlyToggle" } },
    -- Venn
    {
        "jbyuki/venn.nvim",
    },
    -- luarocks
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
    {
        "nvzone/minty",
        cmd = { "Shades", "Huefy" },
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {},
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>qS", function() require("persistence").select() end,              desc = "Select Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
        },
    }
}
