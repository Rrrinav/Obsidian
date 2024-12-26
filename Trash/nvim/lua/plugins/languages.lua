return {
    {
        "simrat39/rust-tools.nvim",
        lazy = true,
        opts = {
            server = {
                on_attach = function(client, bufnr) end,
            },
            tools = {
                autoSetHints = true,
                inlay_hints = {
                    show_parameter_hints = true,
                },
                hover_actions = {
                    border = {
                        { "╭", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╮", "FloatBorder" },
                        { "│", "FloatBorder" },
                        { "╯", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╰", "FloatBorder" },
                        { "│", "FloatBorder" },
                    },
                },
            },
        },
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
    require("conform").setup({
        formatters_by_ft = {
            cpp = { "clang-format" },
            c = { "clang-format" },
        },
    }),
}
