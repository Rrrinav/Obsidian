require("config.lazy")
require("config.basic_gui").setup()
require("config.highlights").setup()
require("config.user_commands").setup()
require("config.swap_words").setup()


-- vim.opt.foldtext = "v:lua.MyFoldText()"
--
-- function _G.MyFoldText()
--     local line = vim.fn.getline(vim.v.foldstart)
--     return line
-- end
-- {1, 2, 3, 4, 5, 6, 7, 8}
-- -- local comment_hl = vim.api.nvim_get_hl_by_name("Comment", true)
-- --  local cursorline_hl = vim.api.nvim_get_hl_by_name("CursorLine", true)
-- --
-- --  -- Extract colors
-- --  local comment_fg = comment_hl.foreground and string.format("#%06x", comment_hl.foreground) or "none"
-- --  local cursorline_bg = cursorline_hl.background and string.format("#%06x", cursorline_hl.background) or "none"
-- --
-- --  -- Print the colors
-- --  print("Comment foreground: " .. comment_fg)
-- --  print("CursorLine background: " .. cursorline_bg)
