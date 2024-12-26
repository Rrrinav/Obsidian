return {
    -- Hihglight colors
    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        opts = {},
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
            filetypes = { "*" },
            user_default_options = {
                names = true, -- "Name" codes like Blue or blue
                -- Expects a table of color name to rgb value pairs.  # is optional
                -- Example: { cool = "#107dac", ["notcool"] = "ee9240" }
                -- Set to false|nil to disable
                names_custom = false,                           -- Custom names to be highlighted: table|function|false|nil
                RGB = true,                                     -- #RGB hex codes
                RRGGBB = true,                                  -- #RRGGBB hex codes
                RRGGBBAA = false,                               -- #RRGGBBAA hex codes
                AARRGGBB = false,                               -- 0xAARRGGBB hex codes
                rgb_fn = false,                                 -- CSS rgb() and rgba() functions
                hsl_fn = false,                                 -- CSS hsl() and hsla() functions
                css = false,                                    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = false,                                 -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Highlighting mode.  'background'|'foreground'|'virtualtext'
                mode = "background",                            -- Set the display mode
                -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True is same as normal
                tailwind = false,                               -- Enable tailwind colors
                -- parsers can contain values used in |user_default_options|
                sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
                -- Virtualtext character to use
                virtualtext = "■",
                -- Display virtualtext inline with color
                virtualtext_inline = false,
                -- Virtualtext highlight mode: 'background'|'foreground'
                virtualtext_mode = "foreground",
                -- update color values even if buffer is not focused
                -- example use: cmp_menu, cmp_docs
                always_update = false,
            },
            -- all the sub-options of filetypes apply to buftypes
            buftypes = {},
            -- Boolean | List of usercommands to enable
            user_commands = true, -- Enable all or some usercommands
        },
    },
    {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    priority = 1000,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
        { "nvim-telescope/telescope-file-browser.nvim" },
    },
    keys = {
        {
            "<leader>tf",
            function()
                local builtin = require("telescope.builtin")
                builtin.find_files(require("telescope.themes").get_ivy({}))
            end,
            desc = "Lists files in your current working directory, respects .gitignore",
        },
        {
            "<leader>tg",
            function()
                local opts = require("telescope.themes").get_ivy({})
                local builtin = require("telescope.builtin")
                builtin.live_grep(opts)
            end,
            desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
        },
        {
            "<leader>tb",
            function()
                local builtin = require("telescope.builtin")
                builtin.buffers()
            end,
            desc = "Lists open buffers",
        },
        {
            "<leader>tt",
            function()
                local builtin = require("telescope.builtin")
                builtin.resume()
            end,
            desc = "Resume the previous telescope picker",
        },
        {
            "<leader>te",
            function()
                local opts = require("telescope.themes").get_ivy({
                    layout_config = { height = 14 },
                })
                local builtin = require("telescope.builtin")
                builtin.diagnostics(opts)
            end,
            desc = "Lists Diagnostics for all open buffers or a specific buffer",
        },
        {
            "<leader>ts",
            function()
                local builtin = require("telescope.builtin")
                builtin.treesitter(require("telescope.themes").get_ivy({}))
            end,
            desc = "Lists Function names, variables, from Treesitter",
        },
        {
            "<leader>tr",
            function()
                local builtin = require("telescope.builtin")
                builtin.registers()
            end,
            desc = "Browse the registers",
        },
        {
            "<leader>tb",
            function()
                local telescope = require("telescope")

                local function telescope_buffer_dir()
                    return vim.fn.expand("%:p:h")
                end

                telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = true,
                    initial_mode = "normal",
                    layout_config = { height = 10 },
                })
            end,
            desc = "Open File Browser with the path of the current buffer",
        },
    },
    opts = {
        defaults = {
            wrap_results = true,
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "bottom" },
            sorting_strategy = "descending",
            winblend = 0,
            mappings = {
                n = {},
            },
        },
        pickers = {
            diagnostics = {
                theme = "ivy",
                initial_mode = "normal",
                layout_config = {
                    preview_cutoff = 9999,
                },
            },
        },
        extensions = {
            file_browser = {
                theme = "dropdown",
                hijack_netrw = true,
                mappings = {
                    ["n"] = {
                        ["N"] = "create",
                        ["h"] = "goto_parent_dir",
                        ["<C-u>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                require("telescope.actions").move_selection_previous(prompt_bufnr)
                            end
                        end,
                        ["<C-d>"] = function(prompt_bufnr)
                            for _ = 1, 10 do
                                require("telescope.actions").move_selection_next(prompt_bufnr)
                            end
                        end,
                    },
                },
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        
        -- Setup telescope
        telescope.setup(opts)

        -- Load extensions
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
},
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts

        opts = {
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                -- "mtime",
            },

            delete_to_trash = false,
        },

        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        opts = {
            -- A list of parser names, or "all" (supported parsers)
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "python",
                "query",
                "regex",
                "rust",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            highlight = {
                -- Enable syntax highlighting
                enable = true,

                -- Disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                additional_vim_regex_highlighting = false,
            },

            indent = { enable = true },

            folde = {
                enable = true
            },

            -- Enable incremental selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn", -- set to `false` to disable one of the mappings
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = false,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "bottom", -- | top | left | right | horizontal | vertical
                        ratio = 0.4
                    },
                },
                suggestion = {
                    enabled = false,
                    auto_trigger = false,
                    hide_during_completion = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    },
    { 'AndreM222/copilot-lualine' }
}
