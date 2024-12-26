return {
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "NormalFloat",    -- plugins which have float panel such as Lazy, Mason, LspInfo
                "NvimTreeNormal", -- NvimTree
            },
        },
    },
    {
        "folke/which-key.nvim",
        opts = {
            preset = "helix",
            spec = {
                { "<leader>t", group = "Telescope plugins" },
                { "<leader>s", group = "Edit surroundings" },
                { "<leader>b", group = "Buffer management" },
                { "<leader>u", group = "UI" },
                { "<leader>c", group = "Code" },
                { "<leader>g", group = "Git" }
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            local icons = LazyVim.config.icons
            vim.o.laststatus = vim.g.lualine_laststatus
            local opts = {
                options = {
                    theme = "auto",
                    globalstatus = vim.o.laststatus == 3,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },

                    lualine_c = {
                        LazyVim.lualine.root_dir(),
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.diagnostics.Error,
                                warn = icons.diagnostics.Warn,
                                info = icons.diagnostics.Info,
                                hint = icons.diagnostics.Hint,
                            },
                        },
                        { "filetype",                   icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { LazyVim.lualine.pretty_path() },

                        { "filename" },
                        {
                            function()
                                -- Table of client names to ignore
                                local excluded_clients = {
                                    ["null-ls"] = true,
                                    -- ["example-lsp"] = true, -- Add more clients to exclude if needed
                                    ["copilot"] = true,
                                }

                                local clients = vim.lsp.get_clients({ bufnr = 0 })
                                if #clients == 0 then
                                    return ""
                                end
                                local names = {}
                                for _, client in pairs(clients) do
                                    -- Skip clients listed in excluded_clients
                                    if not excluded_clients[client.name] then
                                        table.insert(names, client.name)
                                    end
                                end
                                if #names == 0 then
                                    return ""
                                end
                                return "LSP: " .. table.concat(names, ", ")
                            end,
                            icon = "", -- LSP icon
                        },
                    },
                    lualine_x = {
                        Snacks.profiler.status(),
                        -- stylua: ignore
                        {
                            function() return require("noice").api.status.command.get() end,
                            cond = function()
                                return package.loaded["noice"] and
                                    require("noice").api.status.command.has()
                            end,
                            color = function() return { fg = Snacks.util.color("Statement") } end,
                        },
                        -- stylua: ignore
                        {
                            function() return require("noice").api.status.mode.get() end,
                            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                            color = function() return { fg = Snacks.util.color("Constant") } end,
                        },
                        -- stylua: ignore
                        {
                            function() return "  " .. require("dap").status() end,
                            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                            color = function() return { fg = Snacks.util.color("Debug") } end,
                        },
                        -- stylua: ignore
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = function() return { fg = Snacks.util.color("Special") } end,
                        },
                        {
                            "diff",
                            symbols = {
                                added = icons.git.added,
                                modified = icons.git.modified,
                                removed = icons.git.removed,
                            },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                        },
                    },
                    lualine_y = {
                        { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                        { "copilot" }
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "neo-tree", "lazy", "fzf" },
            }

            -- do not add trouble symbols if aerial is enabled
            -- And allow it to be overriden for some buffer types (see autocmds)
            if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
                local trouble = require("trouble")
                local symbols = trouble.statusline({
                    mode = "symbols",
                    groups = {},
                    title = false,
                    filter = { range = true },
                    format = "{kind_icon}{symbol.name:Normal}",
                    hl_group = "lualine_c_normal",
                })
                table.insert(opts.sections.lualine_c, {
                    symbols and symbols.get,
                    cond = function()
                        return vim.b.trouble_lualine ~= false and symbols.has()
                    end,
                })
            end

            return opts
        end,
    },
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
            colorscheme = "rose-pine",
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
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup({
                options = {
                    mode = "buffers",
                    numbers = "ordinal",
                    separator_style = "slant", -- or try "padded_slant"
                    always_show_bufferline = true,
                    show_buffer_close_icons = true,
                    show_tab_indicators = true,
                    diagnostics = "nvim_lsp", -- Enable LSP diagnostics
                    diagnostics_indicator = function(count, level)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    -- Enhanced styling
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    max_name_length = 18,
                    max_prefix_length = 15,
                    tab_size = 18,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true
                        }
                    },
                    color_icons = true,
                    show_duplicate_prefix = true,
                    enforce_regular_tabs = false,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' }
                    },
                },
                highlights = {
                    buffer_selected = {
                        bold = true,
                        italic = false,
                    },
                    diagnostic_selected = {
                        bold = true,
                    },
                    info_selected = {
                        bold = true,
                    },
                    info_diagnostic_selected = {
                        bold = true,
                    },
                },
            })

            -- Keep the same key mappings
            -- local opts = { noremap = true, silent = true }
            -- vim.keymap.set('n', '[b', ':bprevious<CR>', opts)
            -- vim.keymap.set('n', ']b', ':bnext<CR>', opts)
            -- vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', opts)
            -- vim.keymap.set('n', '<leader>bo', ':BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>', opts)  -- Close all except current
            -- vim.keymap.set('n', '<leader>ba', ':BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>:bd<CR>', opts)  -- Close all buffers
        end,
    },
}
