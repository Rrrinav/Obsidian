return {
    -- Hihglight colors
    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        opts = {},
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            DEFAULT_OPTIONS = {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode = "background", -- Set the display mode.
            },
        },
    },
    {
        "telescope.nvim",
        priority = 1000,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-telescope/telescope-file-browser.nvim",
        },
        keys = {
            -- {
            --     "<leader><leader>",
            --     function()
            --         require("telescope.builtin").find_files({
            --             cwd = vim.fn.expand("%:p:h"), -- Current buffer's directory
            --         })
            --     end,
            --     desc = "Find Files (current dir)",
            -- },
            {
                "<leader>;f",
                function()
                    -- local opts = require("telescope.themes").get_ivy({})
                    local builtin = require("telescope.builtin")
                    builtin.find_files(require("telescope.themes").get_ivy({}))
                end,
                desc = "Lists files in your current working directory, respects .gitignore",
            },
            {
                "<leader>;g",
                function()
                    local opts = require("telescope.themes").get_ivy({})
                    local builtin = require("telescope.builtin")
                    builtin.live_grep(opts)
                end,
                desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
            },
            {
                "\\\\",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.buffers()
                end,
                desc = "Lists open buffers",
            },
            {
                "<leader>;;",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.resume()
                end,
                desc = "Resume the previous telescope picker",
            },
            {
                "<leader>;e",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.diagnostics(require("telescope.themes").get_ivy({
                        layout_config = {
                            height = 14,
                        },
                    }))
                end,
                desc = "Lists Diagnostics for all open buffers or a specific buffer",
            },
            {
                "<leader>;s",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.treesitter(require("telescope.themes").get_ivy({}))
                end,
                desc = "Lists Function names, variables, from Treesitter",
            },
            {
                "<leader>;r",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.registers()
                end,
                desc = "Browse the registers",
            },
            {
                "<leader>sf",
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
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local fb_actions = require("telescope").extensions.file_browser.actions

            opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
                wrap_results = true,
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "bottom" },
                sorting_strategy = "descending",
                winblend = 0,
                mappings = {
                    n = {},
                },
            })
            opts.pickers = {
                diagnostics = {
                    theme = "ivy",
                    initial_mode = "normal",
                    layout_config = {
                        preview_cutoff = 9999,
                    },
                },
            }
            opts.extensions = {
                file_browser = {
                    theme = "dropdown",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        -- your custom insert mode mappings
                        ["n"] = {
                            -- your custom normal mode mappings
                            ["N"] = fb_actions.create,
                            ["h"] = fb_actions.goto_parent_dir,
                            ["<C-u>"] = function(prompt_bufnr)
                                for _ = 1, 10 do
                                    actions.move_selection_previous(prompt_bufnr)
                                end
                            end,
                            ["<C-d>"] = function(prompt_bufnr)
                                for _ = 1, 10 do
                                    actions.move_selection_next(prompt_bufnr)
                                end
                            end,
                        },
                    },
                },
            }
            telescope.setup(opts)
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",

        opts = {
            ensure_installed = {
                "typescript",
                "css",
                "gitignore",
                "graphql",
                "http",
                "json",
                "scss",
                "sql",
                "vim",
                "lua",
                "cpp",
                "c",
                "go",
            },
        },
    },
    {
        "stevearc/oil.nvim",
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

            delete_to_trash = true,
        },
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
}
