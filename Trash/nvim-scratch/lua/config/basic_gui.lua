local M = {}

function M.setup()
  vim.o.signcolumn = "auto"
  -- current cursor config
  vim.opt.guicursor =
  "n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50,n-v:blinkwait500-blinkoff250-blinkon200-Cursor/lCursor"

  -- block cursor for everything
  -- vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,n-v:blinkwait500-blinkoff250-blinkon200-Cursor/lCursor"
  vim.opt.guifont = "JetBrainsMono Nerd Font"

  -- Define the highlight groups
  local crusor_fg = "#cc9900"
  local white_alt = "#fff1da"
  --
  vim.api.nvim_set_hl(0, "Cursor", { fg = white_alt, bg = "#fff1da" })
  vim.api.nvim_set_hl(0, "CursorReset", { fg = white_alt, bg = "#fff1da" })
  vim.api.nvim_set_hl(0, "lcursor", { fg = white_alt, bg = "#fff1da" })

  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.cursorline = true
  vim.opt.showmatch = true -- Highlight matching parentheses
  vim.opt.termguicolors = true -- Enable true color support
  vim.opt.fillchars = {
    eob = " ", -- Replace `~` with space on empty lines
    fold = " ", -- Clean folding markers
    vert = "│", -- Beautiful window separator
  }

  vim.opt.numberwidth = 1
  -- Indentation
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.shiftwidth = 2 -- Indent by 2 spaces
  vim.opt.tabstop = 2 -- Tab width
  vim.opt.softtabstop = 2 -- Make spaces feel like tabs
  vim.opt.smartindent = true -- Enable smart indentation
  vim.opt.wrap = false -- Disable line wrapping
  vim.opt.breakindent = true -- Maintain indent when wrapping
  vim.opt.fillchars:append({
    vert = "│", -- Minimal vertical split line
    vertleft = "│",
    vertright = "│",
    verthoriz = "│",
    horiz = "─",
    horizup = "─",
    horizdown = "─",
  })
  -- Search
  vim.opt.ignorecase = true -- Ignore case when searching
  vim.opt.smartcase = true  -- Override ignorecase when using uppercase
  vim.opt.hlsearch = true   -- Highlight search results
  vim.opt.incsearch = true  -- Show search matches as you type

  -- Editor behavior
  vim.opt.hidden = true                    -- Allow switching buffers without saving
  vim.opt.clipboard = "unnamedplus"        -- Use system clipboard
  vim.opt.mouse = "a"                      -- Enable mouse support
  vim.opt.undofile = true                  -- Persistent undo history
  vim.opt.backup = false                   -- Disable backup files
  vim.opt.writebackup = false              -- Disable backup files
  vim.opt.updatetime = 250                 -- Faster completion
  vim.opt.timeoutlen = 300                 -- Faster key sequence completion
  vim.opt.completeopt = "menuone,noselect" -- Better completion experience

  -- Window management
  vim.o.splitbelow = true   -- Split windows below
  vim.o.splitright = true   -- Split windows right
  vim.opt.scrolloff = 8     -- Minimal number of lines to keep above/below cursor
  vim.opt.sidescrolloff = 8 -- Minimal number of columns to keep left/right of cursor

  -- Make sure folding is enabled but starts unfolded
  vim.opt.foldenable = true
  vim.opt.foldlevel = 99
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldenable = true
  vim.opt.foldlevel = 99      -- Start with all folds open
  vim.opt.foldlevelstart = 99 -- Start with all folds open
  vim.opt.foldtext = ""

  -- File handling
  vim.bo.modifiable = true
  vim.opt.fileencoding = "utf-8" -- Use UTF-8 encoding
  vim.opt.swapfile = false       -- Disable swap files
end

return M
