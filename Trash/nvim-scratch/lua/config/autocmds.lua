local autocmd_group = vim.api.nvim_create_augroup("CustomSettings", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "text" then
            local save = vim.fn.winsaveview()
            vim.cmd([[%s/\s\+$//e]])
            vim.fn.winrestview(save)
        end
    end,
})

-- Instead of using vim.opt directly, use an autocmd that excludes the dashboard
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        -- Exclude specific filetypes like cmp, popup, dashboard, help, etc.
        if vim.bo.filetype ~= "snacks_dashboard" and
           vim.bo.filetype ~= "cmp" and
           vim.bo.filetype ~= "popup" and
           vim.bo.filetype ~= "TelescopePrompt" and
           vim.bo.filetype ~= "TelescopeResults" and
           vim.bo.filetype ~= "help" and
           vim.bo.filetype ~= "man" then
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
            vim.opt_local.cursorline = true
        end
    end
})

-- Restore cursor position when opening file
vim.api.nvim_create_autocmd("BufReadPost", {
    group = autocmd_group,
    pattern = "*",
    callback = function()
        local line = vim.fn.line([['"]])
        if line > 1 and line <= vim.fn.line("$") then
            vim.cmd("normal! g`\"")
        end
    end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = autocmd_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- LazyLoad specific settings
vim.api.nvim_create_autocmd("BufEnter", {
    group = autocmd_group,
    pattern = "LazyLoad",
    callback = function()
        vim.opt.number = true
        vim.o.splitright = true
        -- You can add more LazyLoad-specific settings here
    end,
})
