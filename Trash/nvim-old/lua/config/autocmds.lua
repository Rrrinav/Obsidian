-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Open a floating terminal in project root directory
vim.api.nvim_create_user_command("Fterm", function(opts)
    local cmd = opts.args ~= "" and opts.args or "bash"
    require("snacks.terminal").open(cmd, { style = "minimal", border = "rounded" })
end, { nargs = "?" })

-- Open floating terminal in the current buffer's directory
vim.api.nvim_create_user_command("Ftermdir", function(opts)
    local cmd = opts.args ~= "" and opts.args or "bash"
    local cwd = vim.fn.expand("%:p:h") -- Get the current buffer's directory
    require("snacks.terminal").open(cmd, { cwd = cwd })
end, { nargs = "?" })

-- Reload the current buffer with clipboard content
vim.api.nvim_create_user_command("PasteClipboard", function()
    -- Get the content from the clipboard
    local clipboard_content = vim.fn.getreg("+")

    -- Get the current buffer line count
    local line_count = vim.api.nvim_buf_line_count(0)

    -- Replace the content of the buffer while preserving settings
    vim.api.nvim_buf_set_lines(0, 0, line_count, false, vim.split(clipboard_content, "\n"))
end, {})

-- Copy entire buffer
vim.api.nvim_create_user_command("CopyBuffer", function()
    vim.cmd("%y+")
end, {})

-- Function to generate execution commands based on file type
local function get_execution_command(filepath, filetype)
    local filename = vim.fn.expand("%:t:r") -- Get the file name without extension
    local output = vim.fn.expand("%:p:h") .. "/" .. filename -- Output binary in the same directory as the source file

    if filetype == "lua" then
        return "lua " .. filepath
    elseif filetype == "python" then
        return "python " .. filepath
    elseif filetype == "sh" then
        return "bash " .. filepath
    elseif filetype == "cpp" then
        return "g++ -o " .. output .. " " .. filepath .. " && " .. output
    elseif filetype == "c" then
        return "gcc -o " .. output .. " " .. filepath .. " && " .. output
    elseif filetype == "rust" then
        return "rustc -o " .. output .. " " .. filepath .. " && " .. output
    elseif filetype == "go" then
        return "go run " .. filepath
    else
        return nil
    end
end

-- Create the ExecuteFile command
vim.api.nvim_create_user_command("ExecuteFile", function()
    local filepath = vim.fn.expand("%:p") -- Get the full path of the current file
    local filetype = vim.bo.filetype -- Get the file type of the current buffer

    -- Get the command to execute the file
    local cmd = get_execution_command(filepath, filetype)

    if cmd then
        -- Open bash and execute the command, keeping the terminal open by using exec bash after running the command
        local bash_cmd = "bash -c '" .. cmd .. " || true; exec bash'"
        -- Open or toggle the floating terminal with the generated command
        require("snacks.terminal").toggle(bash_cmd, { cwd = vim.fn.expand("%:p:h") })
    else
        -- Notify the user if no execution command is defined for the file type
        vim.notify("No execution command defined for file type: " .. filetype, vim.log.levels.ERROR)
    end
end, {})
