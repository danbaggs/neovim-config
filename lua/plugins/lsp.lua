return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { "saghen/blink.cmp" },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      -- {
      --   "jay-babu/mason-null-ls.nvim", -- Add mason-null-ls for managing Ruff and other linters/formatters
      --   dependencies = { "nvimtools/none-ls.nvim" },
      -- },
    },
    config = function()
      require('mason').setup()
      ---@diagnostic disable-next-line: missing-fields
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",   -- Bash
          "clangd",   -- C
          "dockerls", -- Docker
          "gopls",    -- Go
          "lua_ls",   -- Lua
          "marksman", -- Markdown
          "pyright",  -- Python
          "yamlls",   -- YAML
        },
      })

      require('mason-tool-installer').setup({
        -- Install these linters, formatters, debuggers automatically
        ensure_installed = {
          -- Python
          'black',
          'debugpy',
          'flake8',
          'isort',
          'mypy',
          'pylint',
          -- Go
          "gopls",
          "delve",
        },
      })
      vim.api.nvim_command('MasonToolsInstall')

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      -- Set up lua LSP
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
          },
        },
      }

      -- Set up c LSP
      lspconfig.clangd.setup { capabilities = capabilities }

      -- Set up yaml LSP
      lspconfig.yamlls.setup { capabilities = capabilities }

      -- Set up Pyright (Python LSP)
      lspconfig.pyright.setup {
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      }

      -- Set up ruff formatter and linter
      lspconfig.ruff.setup {
        capabilities = capabilities,
      }

      -- Set up Go LSP
      lspconfig.gopls.setup {
        capabilities = capabilities,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method("textDocument/formatting") then
            -- Format current buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
      local open_floating_preview = vim.lsp.util.open_floating_preview
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        ---@diagnostic disable-next-line: inject-field
        opts.border = opts.border or "rounded" -- Set border to rounded
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end,
  }
}
