return {
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
                "NvimTreeNormal", -- NvimTree
            },
        },
    },
    {
        "folke/which-key.nvim",
        opts = {
            preset = "helix",
            spec = {
                { "<leader>;", group = "Telescope plugins" },
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false,
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "3rd/image.nvim" },
        opts = {
            -- sources = {
            --     "filesystem",
            -- },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },

                -- hijack_netrw_behavior = "enabled", -- Disable hijacking so Neo-tree doesn't open automatically
            },
        },
        keys = {
            -- Local file tree (current buffer's directory)
            {
                "<leader>e",
                function()
                    require("neo-tree.command").execute({
                        toggle = true,
                        position = "left",
                        source = "filesystem",
                        reveal = true,
                        -- dir = vim.fn.expand("%:p:h"), -- Current buffer's directory
                        vim.fn.getcwd(),
                    })
                end,
                desc = "Explorer NeoTree (current dir)",
            },

            -- Root directory file tree
            {
                "<leader>E",
                function()
                    require("neo-tree.command").execute({
                        toggle = true,
                        position = "left",
                        source = "filesystem",
                        reveal = true,
                    })
                end,
                desc = "Explorer NeoTree (root dir)",
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_c = {
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
            },
        },
    },
    {
        "Mofiqul/dracula.nvim",
        -- opts = {
        --     lualine_bg_color = "#aa4755", -- default nil
        -- },
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
        "folke/noice.nvim",
        enabled = true,
        opts = {
            cmdline = {
                enabled = true, -- enable command-line UI
                view = "cmdline", -- show command-line in a floating popup
                format = {
                    cmdline = { icon = " " }, -- icon for normal cmdline
                    search_down = { icon = " ↓ " }, -- icon for `/` searches
                    search_up = { icon = " ↑ " }, -- icon for `?` searches
                    filter = { icon = " " }, -- icon for `:` filters
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
                },
            },
            popupmenu = {
                enabled = true, -- enables the Noice popupmenu UI
                ---@type 'nui'|'cmp'
                backend = "nui", -- backend to use to show regular cmdline completions
                ---@type NoicePopupmenuItemKind|false
                -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
                kind_icons = {}, -- set to `false` to disable icons
            },
            messages = {
                enabled = true, -- enable message UI
                view = "notify", -- use the nvim-notify for messages
                view_error = "notify", -- use notify for error messages
                view_warn = "notify", -- use notify for warnings
                view_history = "messages", -- keep message history
            },
            lsp = {
                signature = {
                    enabled = true,
                    auto_open = {
                        enabled = false,
                    },
                },
                progress = {
                    enabled = true, -- show LSP progress
                    format = {
                        { "{spinner}", hl_group = "NoiceLspProgressSpinner" },
                        { " {title} ", hl_group = "NoiceLspProgressTitle" },
                        { "{progress}%", hl_group = "NoiceLspProgressPercent" },
                    },
                },
                documentation = {
                    view = "hover",
                    ---@type NoiceViewOptions
                    opts = {
                        lang = "markdown",
                        replace = false,
                        render = "plain",
                        format = { "{message}" },
                        win_options = { concealcursor = "n", conceallevel = 0 },
                    },
                },
            },
            notify = {
                enabled = true, -- enable fancy notifications
                view = "mini", -- use a compact view for notifications
            },
            views = {
                cmdline_popup = {
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    position = function()
                        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                        return { row = row + 1, col = col }
                    end,
                    filter_options = {
                        { label = "Search", value = "search" },
                    },
                },
                cmdline_popupmenu = {
                    relative = "editor",
                    position = {
                        row = -2,
                        col = "1",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                        max_height = 15,
                    },
                    border = {
                        style = "single",
                        padding = { 0, 3 },
                    },
                    win_options = {
                        winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
                    },
                },
                hover = {
                    border = {
                        style = "rounded",
                    },
                    position = { row = 1, col = 0 },
                },
            },
            presets = {
                bottom_search = true, -- classic bottom search like Vim
                command_palette = true, -- integrate with command palettes
                inc_rename = false,
                lsp_doc_border = true, -- border around hover/doc highlights
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
        },
    },
}
