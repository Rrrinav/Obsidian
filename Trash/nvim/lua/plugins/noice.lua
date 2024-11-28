return {
    require("noice").setup({
        cmdline = {
            enabled = true, -- enable command-line UI
            view = "cmdline", -- show command-line in a floating popup
            format = {
                cmdline = { icon = " " }, -- icon for normal cmdline
                search_down = { icon = "  ↓ " }, -- icon for `/` searches
                search_up = { icon = "  ↑ " }, -- icon for `?` searches
                filter = { icon = " " }, -- icon for `:` filters
            },
        },
        messages = {
            enabled = true, -- enable message UI
            view = "notify", -- use the nvim-notify for messages
            view_error = "notify", -- use notify for error messages
            view_warn = "notify", -- use notify for warnings
            view_history = "messages", -- keep message history
        },
        popupmenu = {
            enabled = true, -- enable popupmenu for autocompletions
            backend = "nui", -- use nui.nvim for UI
        },
        lsp = {
            override = {
                -- Override LSP message rendering for better visuals
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
            progress = {
                enabled = true, -- show LSP progress
                format = {
                    { "{spinner}", hl_group = "NoiceLspProgressSpinner" },
                    { " {title} ", hl_group = "NoiceLspProgressTitle" },
                    { "{progress}%", hl_group = "NoiceLspProgressPercent" },
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
                filter_options = {
                    { label = "Search", value = "search" },
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
    }),
}
