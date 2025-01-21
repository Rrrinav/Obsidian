return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            floating_window = false, -- Disable floating signature window
            servers = {
                clangd = {
                    cmd = { "clangd" },
                    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
                    root_dir = require("lspconfig").util.root_pattern(
                        ".clangd",
                        ".clang-tidy",
                        ".clang-format",
                        "compile_commands.json",
                        "compile_flags.txt",
                        "configure.ac",
                        ".git"
                    ),
                    settings = {
                        completeUnimported = true,
                        fallbackFlags = { "-std=c++11" },
                    },
                },
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "clippy",
                            },
                            inlayHints = {
                                enable = true,
                                showParameterHints = true,
                                parameterHintsPrefix = "",
                                otherHintsPrefix = "",
                            },
                        },
                    },
                },
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "rustfmt", "rust-analyzer", "clangd" },
        },
    },
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = "rafamadriz/friendly-snippets",

        -- use a release tag to download pre-built binaries
        version = "*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            signature = { enabled = true },
        },
    },
}
