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
        "declancm/cinnamon.nvim",
        config = function()
            require("cinnamon").setup()
        end,
    },
}
