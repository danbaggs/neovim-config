return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile", },
  config = function()
    require 'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = {
        "bash",
        "csv",
        "diff",
        "dockerfile",
        "editorconfig",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "helm",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "mermaid",
        "printf",
        "proto",
        "python",
        "query",
        "regex",
        "requirements",
        "rust",
        "sql",
        "terraform",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      modules = {},
      ignore_install = {},
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      highlight = {
        enable = true,
        ---@diagnostic disable-next-line: unused-local
        disable = function(lang, buf)       -- disable treesitter for files larger than [max_filesize] KB
          local max_filesize = 512 * 1024   -- 512 KB
          ---@diagnostic disable-next-line: undefined-field
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
