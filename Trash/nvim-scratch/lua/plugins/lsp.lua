return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",        -- Lua
        "pyright",       -- Python
        "rust_analyzer", -- Rust
        -- "clangd",        -- C/C++
        -- Add more LSPs as needed
      },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local signs = {
        Error = "",
        Warn = "",
        Hint = "󰌵",
        Info = "",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Configure diagnostic display
      vim.diagnostic.config({
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        virtual_text = {
          prefix = " ■", -- Could be '■', '▎', 'x'
          source = "if_many",
        },
      })
      local lspconfig = require("lspconfig")
      -- LSP keybindings
      local function with_desc(description, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        if description then
          opts.desc = description
        end
        return opts
      end
      -- on_attach function for LSP key mappings
      local on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable()
        end
        vim.keymap.set(
          "n",
          "gD",
          "<cmd>lua vim.lsp.buf.declaration()<CR>",
          with_desc("Go to declaration", bufnr)
        ) -- Go to declaration
        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
          if #vim.fn.getqflist() == 1 then vim.cmd('cc 1') end
        end, with_desc("Go to definition", bufnr))                                                               -- Go to definition
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", with_desc("Go to references", bufnr)) -- Go to references
        vim.keymap.set(
          "n",
          "gI",
          "<cmd>lua vim.lsp.buf.implementation()<CR>",
          with_desc("Go to implementation", bufnr)
        )                                                                                                  -- Go to implementation
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", with_desc("Hover", bufnr))            -- Hover
        vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", with_desc("Rename", bufnr)) -- Rename

        -- Diagnostics
        vim.keymap.set(
          "n",
          "[d",
          "<cmd>lua vim.diagnostic.goto_prev()<CR>",
          with_desc("Go to previous diagnostic", bufnr)
        ) -- Go to previous diagnostic
        vim.keymap.set(
          "n",
          "]d",
          "<cmd>lua vim.diagnostic.goto_next()<CR>",
          with_desc("Go to next diagnostic", bufnr)
        ) -- Go to next diagnostic
        vim.keymap.set(
          "n",
          "<leader>e",
          "<cmd>lua vim.diagnostic.open_float()<CR>",
          with_desc("Show line diagnostics", bufnr)
        ) -- Show line diagnostics
      end

      -- Default LSP configuration to apply to all servers
      local default_config = {
        on_attach = on_attach,
      }

      require 'lspconfig'.clangd.setup({
        cmd = { "clangd", "--std=c++20" },
      })
      -- Automatically setup servers installed via Mason
      require("mason-lspconfig").setup_handlers({
        -- Default handler
        function(server_name)
          lspconfig[server_name].setup(default_config)
        end,
        -- Override configs for specific servers
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup(vim.tbl_extend("force", default_config, {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          }))
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      -- Set up formatters per filetype
      formatters_by_ft = {
        -- Prefer prettier for frontend files
        -- javascript = { "prettier" },
        -- typescript = { "prettier" },
        -- javascriptreact = { "prettier" },
        -- typescriptreact = { "prettier" },
        -- css = { "prettier" },
        -- html = { "prettier" },
        -- json = { "prettier" },
        -- yaml = { "prettier" },
        -- markdown = { "prettier" },
        -- -- Python formatters
        -- python = { "isort", "black" },
        -- -- Formatting rust
        -- rust = { "rustfmt" },
        -- -- Shell script formatting
        -- sh = { "shfmt" },
        -- c = { "clang-format" },
        cpp = { "clang-format" },
      },
      -- Customize formatters
      formatters = {
        prettier = {
          -- You can add custom prettier config here
          prepend_args = { "--tab-width", "2" },
        },
        black = {
          prepend_args = { "--line-length", "150" },
        },
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
      -- Format on save settings
      format_on_save = {
        enabled = false,
        timemut_ms = 500,
        lsp_fallback = true,
      },
      -- Notify on formatting errors
      notify_on_error = true,
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    opts = {
      -- Buffer types to ignore
      buf_ignore = { "nofile" },
      -- Delay, in miliseconds
      -- to wait before a redraw occurs(after an event is triggered)
      debounce = 50,
      -- Filetypes where the plugin is enabled
      filetypes = { "markdown", "quarto", "rmd" },
      -- Highlight groups to use
      -- "dynamic" | "light" | "dark"
      highlight_groups = "dynamic",
      -- Modes where hybrid mode is enabled
      hybrid_modes = nil,
      -- Tree-sitter query injections
      injections = {},
      -- Initial plugin state,
      -- true = show preview
      -- falss = don't show preview
      initial_state = false,
      -- Max file size that is rendered entirely
      max_file_length = 1000,
      -- Modes where preview is shown
      modes = { "n", "no", "c" },
      -- Lines from the cursor to draw when the
      -- file is too big
      render_distance = 100,
      -- Window configuration for split view
      split_conf = {},

      -- Rendering related configuration
      block_quotes = {},
      callbacks = {},
      checkboxes = {},
      code_blocks = {},
      escaped = {},
      footnotes = {},
      headings = {},
      horizontal_rules = {},
      html = {},
      inline_codes = {},
      latex = {},
      links = {},
      list_items = {},
      tables = {}
    }
  }
}
