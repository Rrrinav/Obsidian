-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add keymap to save not save anything to the clipboard when pressing nd in normal mode using keymap "_d-
-- Open compiler
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
    "n",
    "<S-F6>",
    "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
        .. "<cmd>CompilerRedo<cr>",
    { noremap = true, silent = true }
)

-- Prevent `d` from storing deleted text in the clipboard
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })

vim.keymap.set("v", "p", '"*p', { noremap = true, silent = true })

-- Allow `x` to store deleted text in the clipboard
vim.keymap.set("n", "x", "x", { noremap = true, silent = true })
vim.keymap.set("v", "x", "x", { noremap = true, silent = true })
