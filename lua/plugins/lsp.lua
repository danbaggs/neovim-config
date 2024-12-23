return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
          require("mason").setup()
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "lua_ls",
              "pyright",
              "yamlls",
            },
          })
        end,
      },
      -- {
      --   "jay-babu/mason-null-ls.nvim", -- Add mason-null-ls for managing Ruff and other linters/formatters
      --   dependencies = { "nvimtools/none-ls.nvim" },
      --   config = function()
      --     -- Set up mason-null-ls to ensure Ruff is installed
      --     require("mason-null-ls").setup({
      --       ensure_installed = { "ruff" }, -- Ensure Ruff is installed
      --     })
      --
      --     local null_ls = require("null-ls")
      --     null_ls.setup({
      --       sources = {
      --         null_ls.builtins.diagnostics.ruff, -- Add Ruff as a linter
      --       },
      --     })
      --   end,
      -- },
      {
        "saghen/blink.cmp"
      },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Set up Lua LSP
      require('lspconfig').lua_ls.setup { capabilities = capabilities }

      -- Set up yaml LSP
      require('lspconfig').yamlls.setup { capabilities = capabilities }

      -- Set up Pyright (Python LSP)
      require('lspconfig').pyright.setup {
        capabilities = capabilities,
        -- settings = {
        --   python = {
        --     analysis = {
        --       -- typeCheckingMode = "strict", -- Enable strict type checking
        --       autoSearchPaths = true,
        --       useLibraryCodeForTypes = true,
        --     },
        --   },
        -- },
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
