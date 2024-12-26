return
{
    {
        "giuxtaposition/blink-cmp-copilot"
    },
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon",         "label", gap = 1 },
                            { "label_description", "kind" }
                        },
                    }
                },
                ghost_text = {
                    enabled = true,
                },
            },
            sources = {
                default = { "luasnip", "lsp", "path", "snippets", "buffer", "copilot" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                        transform_items = function(_, items)
                            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                            local kind_idx = #CompletionItemKind + 1
                            CompletionItemKind[kind_idx] = "Copilot"
                            for _, item in ipairs(items) do
                                item.kind = kind_idx
                            end
                            return items
                        end,
                    },
                },
            },
            signature = { enabled = true },
            appearance = {
                kind_icons = {
                    Copilot = "",
                    Text = '󰉿',
                    Method = '󰊕',
                    Function = '󰊕',
                    Constructor = '󰒓',

                    Field = '󰜢',
                    Variable = '󰆦',
                    Property = '󰖷',

                    Class = '󱡠',
                    Interface = '󱡠',
                    Struct = '󱡠',
                    Module = '󰅩',

                    Unit = '󰪚',
                    Value = '󰦨',
                    Enum = '󰦨',
                    EnumMember = '󰦨',

                    Keyword = '󰻾',
                    Constant = '󰏿',

                    Snippet = '󱄽',
                    Color = '󰏘',
                    File = '󰈔',
                    Reference = '󰬲',
                    Folder = '󰉋',
                    Event = '󱐋',
                    Operator = '󰪚',
                    TypeParameter = '󰬛',
                },
            },
            keymap = {
                preset = 'default',
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-n>'] = { 'select_next', 'fallback' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                cmdline = {
                    ['<C-p>'] = { 'select_prev', 'fallback' },
                    ['<C-n>'] = { 'select_next', 'fallback' },
                    ['<C-y>'] = { 'accept', 'fallback' },
                }
            },
        },
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        opts = {
            backend = "kitty",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = true,
                    filetypes = { "markdown", "vimwiki" },
                },
                neorg = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    filetypes = { "norg" },
                },
                html = {
                    enabled = false,
                },
                css = {
                    enabled = false,
                },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = 50,
            window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
            tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
            hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
        },
    },
    {
        "ej-shafran/compile-mode.nvim",
        -- tag = "v5.*",
        -- you can just use the latest version:
        -- branch = "latest",
        -- or the most up-to-date updates:
        branch = "nightly",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- if you want to enable coloring of ANSI escape codes in
            -- compilation output, add:
            { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
        config = function()
            ---@type CompileModeOpts
            vim.g.compile_mode = {
                -- to add ANSI escape code support, add:
                -- baleia_setup = true,
            }
        end,
    },
    {
        "okuuva/auto-save.nvim",
        cmd = "ASToggle",                           -- optional for lazy loading on command
        event = { "InsertLeave" },                  -- optional for lazy loading on trigger events
        opts = {
            trigger_events = {                      -- See :h events
                immediate_save = { "InsertLeave" }, -- vim events that trigger an immediate save
                defer_save = { "InsertLeave" },     -- vim events that trigger a deferred save (saves after `debounce_delay`)
            },                                      -- your config goes here
            -- or just leave it empty :)
        },
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        opts = {
            -- Add custom surroundings to be used on top of builtin ones. For more
            -- information with examples, see `:h MiniSurround.config`.
            custom_surroundings = nil,

            -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
            highlight_duration = 500,

            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                add = '<leader>sa',            -- Add surrounding in Normal and Visual modes
                delete = '<leader>sd',         -- Delete surrounding
                find = '<leader>sf',           -- Find surrounding (to the right)
                find_left = '<leader>sF',      -- Find surrounding (to the left)
                highlight = '<leader>sh',      -- Highlight surrounding
                replace = '<leader>sr',        -- Replace surrounding
                update_n_lines = '<leader>sn', -- Update `n_lines`

                suffix_last = 'l',             -- Suffix to search with "prev" method
                suffix_next = 'n',             -- Suffix to search with "next" method
            },

            -- Number of lines within which surrounding is searched
            n_lines = 20,

            -- Whether to respect selection type:
            -- - Place surroundings on separate lines in linewise mode.
            -- - Place surroundings on each line in blockwise mode.
            respect_selection_type = false,

            -- How to search for surrounding (first inside current line, then inside
            -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
            -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
            -- see `:h MiniSurround.config`.
            search_method = 'cover',

            -- Whether to disable showing non-error feedback
            -- This also affects (purely informational) helper messages shown after
            -- idle time if user input is required.
            silent = false,
        }
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            require('grug-far').setup({
            });
        end
    },
}
