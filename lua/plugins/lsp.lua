return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "saghen/blink.cmp" },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          bash = { "beautysh" },
          proto = { "buf" },
          go = { "crlfmt" },
          lua = { lsp_format = "prefer" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          json = { "jq" },
          markdown = { "markdownfmt" },
          python = { "ruff_fix", "ruff_organize_imports", "ruff_format", lsp_format = "first" },
          rust = { "rustfmt" },
          toml = { "taplo" },
          yaml = { "yamlfix" },
        },
      },
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
    require("mason").setup()
    ---@diagnostic disable-next-line: missing-fields
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",        -- Bash
        "buf_ls",        -- Protobuf
        "dockerls",      -- Docker
        "gopls",         -- Go
        "lua_ls",        -- Lua
        "jsonls",        -- JSON
        "marksman",      -- Markdown
        "pyright",       -- Python
        "rust_analyzer", -- Rust
        "ts_ls",         -- Javascript/Typescript
        "yamlls",        -- YAML
      },
    })

    require("mason-tool-installer").setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        -- Python
        "debugpy",
        "flake8",
        "isort",
        "mypy",
        "pylint",
        "pyright",
        -- Go
        "gopls",
        "delve",
        -- JS/TS
        "prettier",
        "prettierd",
        "jsonls"
      },
    })
    vim.api.nvim_command("MasonToolsInstall")

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require('render-markdown').setup({ latex = { enabled = false } })

    -- Set up lua LSP
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- Set up rust LSP
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = "clippy",
          },
          diagnostics = {
            enable = true,
          }
        }
      }
    })
    vim.lsp.enable("rust_analyzer")

    -- Set up yaml LSP
    vim.lsp.config("yamlls", {
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
              "/azure-pipeline*.y*l",
              "/*.azure*",
              "Azure-Pipelines/**/*.y*l",
              "Pipelines/*.y*l",
              "CI/*.y*l",
              "CD/*.y*l",
            },
          },
        },
      },
    })
    vim.lsp.enable("yamlls")

    -- Set up Pyright (Python LSP)
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { "*" },
          },
        },
      },
    })
    vim.lsp.enable("pyright")

    -- Set up protobuf formatter and linter
    vim.lsp.config("buf_ls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("buf_ls")

    -- Set up ruff formatter and linter
    vim.lsp.config("ruff", {
      capabilities = capabilities,
    })
    vim.lsp.enable("ruff")

    -- Set up Go LSP
    vim.lsp.config("gopls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("gopls")

    -- Set up JSON LSP
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("jsonls")

    -- Set up Javascript/Typescript LSP
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end

        if client:supports_method("textDocument/formatting") then
          -- Format current buffer on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
              require("conform").format({ bufnr = args.buf, id = client.id, lsp_format = "fallback" })
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
