local M = {}

function M.setup()
  local bg_color = "#181818"
  -- local bg_color = "#0E051A"
  require('transparent').clear_prefix('BufferLine')
  require('transparent').clear_prefix('Telescope')

  vim.cmd [[
    highlight TelescopeSelection guibg=#1e1e2e guifg=#eceff4
    highlight TelescopeSelectionCaret guibg=#1e1e2e guifg=#88c0d0
  ]]
  -- Change the background color of the line numbers
  -- vim.cmd([[highlight LineNr guibg=#1e1e2e guifg=#bbbbbb]])
  -- vim.cmd([[highlight CursorLineNr guibg=#1e1e2e guifg=#ffffff]])
  -- General highlights
  vim.api.nvim_set_hl(0, "Normal", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NormalNCFloat", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NormalPopup", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NormalPopupFloat", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NormalPopupNC", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = bg_color })
  vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "#aaaaaa" })

  -- Telescope highlights
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bg_color })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = bg_color })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bg_color })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = bg_color })
  vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bg_color })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = bg_color })
  vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg_color })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = bg_color })

  -- Trouble windows
  vim.api.nvim_set_hl(0, "TroubleNormal", { bg = bg_color })   -- Main Trouble window
  vim.api.nvim_set_hl(0, "TroubleFolded", { bg = bg_color })   -- Folded items in Trouble window
  vim.api.nvim_set_hl(0, "TroubleCount", { bg = bg_color })    -- Trouble count (e.g., number of errors)
  vim.api.nvim_set_hl(0, "TroubleIndent", { bg = bg_color })   -- Indentation in Trouble window
  vim.api.nvim_set_hl(0, "TroubleText", { bg = bg_color })     -- Text in the Trouble window
  vim.api.nvim_set_hl(0, "TroublePreview", { bg = bg_color })  -- Preview window for Trouble (if applicable)
  vim.api.nvim_set_hl(0, "TroubleLocation", { bg = bg_color }) -- Location (e.g., file path) in Trouble
end

return M
