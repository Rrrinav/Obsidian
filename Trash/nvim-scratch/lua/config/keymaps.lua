vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>")
vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>")
-- Fix visual mode paste behavior
vim.keymap.set("x", "p", [["_dP]]) -- Don't copy replaced text when pasting in visual mode

-- Optional: Additional clipboard-related settings for better behavior
vim.api.nvim_set_keymap("v", "p", '"+p', { noremap = true, silent = true })

-- If you want to prevent auto-yanking on delete
vim.keymap.set("v", "d", [["_d]]) -- Delete without yanking in visual mode
-- For better paste behavior overall
vim.opt.mouse = "a"               -- Enable mouse support
-- Prevent `d` from storing deleted text in the clipboard
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })

-- Allow `x` to store deleted text in the clipboard
vim.keymap.set("n", "x", "x", { noremap = true, silent = true })
vim.keymap.set("v", "x", "x", { noremap = true, silent = true })

vim.keymap.set("n", "-", "<Cmd>Oil<cr>")

vim.api.nvim_set_keymap('n', '<leader>cf',
  ':lua require("conform").format({ async = true, lsp_fallback = true })<CR>',
  { noremap = true, silent = true, nowait = true, desc = "Format buffer" })

vim.keymap.set("n", "<A-t>", "<leader>Cw<leader>R", { noremap = true, silent = true, desc = "Swap words" })

local function hide_diagnostics()
  vim.diagnostic.config({ -- https://neovim.io/doc/user/diagnostic.html
    virtual_text = false,
    signs = false,
    underline = false,
  })
end
local function show_diagnostics()
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
  })
end

vim.keymap.set("n", "<leader>xh", hide_diagnostics, { noremap = true, desc = "Hide diagnostics" })
vim.keymap.set("n", "<leader>xs", show_diagnostics, { noremap = true, desc = "Show diagnostics" })
vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.b.completion = false<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ce', ':lua vim.b.completion = true<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>xt", ":TodoQuickFix<CR>", { noremap = true, desc = "List todos" })
vim.keymap.set("n", "<leader>fv", '<Cmd>vsplit | term<Cr>', { noremap = true, desc = "Vertical split terminal" })
