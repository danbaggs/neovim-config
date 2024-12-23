return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = {
          "arduino",
          "bash",
          "c",
          "csv",
          "dockerfile",
          "editorconfig",
          "git_rebase",
          "gitcommit",
          "gitignore",
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
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        modules = {},
        ignore_install = {},
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 512 * 1024 -- 512 KB
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
}
