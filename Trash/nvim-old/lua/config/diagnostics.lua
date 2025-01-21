local M = {}

local severity_map = {
    [vim.diagnostic.severity.ERROR] = "DiagnosticError",
    [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
    [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
    [vim.diagnostic.severity.HINT] = "DiagnosticHint",
}
local icon_map = {
    [vim.diagnostic.severity.ERROR] = "  ",
    [vim.diagnostic.severity.WARN] = "  ",
    [vim.diagnostic.severity.INFO] = "  ",
    [vim.diagnostic.severity.HINT] = "  ",
}

local function source_string(source)
    return string.format("  [%s]", source or "Unknown")
end

M.line_diagnostics = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
    local diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })
    if vim.tbl_isempty(diagnostics) then
        return
    end

    local lines = {}

    for _, diagnostic in ipairs(diagnostics) do
        table.insert(lines, icon_map[diagnostic.severity] .. " " .. diagnostic.message:gsub("\n", " ") .. source_string(diagnostic.source))
    end

    local floating_bufnr, _ = vim.lsp.util.open_floating_preview(lines, "plaintext", {
        border = vim.g.floating_window_border_dark or "rounded",
    })

    for i, diagnostic in ipairs(diagnostics) do
        local message_length = #lines[i] - #source_string(diagnostic.source)
        vim.api.nvim_buf_add_highlight(floating_bufnr, -1, severity_map[diagnostic.severity], i - 1, 0, message_length)
        vim.api.nvim_buf_add_highlight(floating_bufnr, -1, "DiagnosticSource", i - 1, message_length, -1)
    end
end

return M
