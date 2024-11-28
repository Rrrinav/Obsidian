return {
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
                            ["example-lsp"] = true, -- Add more clients to exclude if needed
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
}
