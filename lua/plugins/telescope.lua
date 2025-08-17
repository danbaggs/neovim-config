return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = {
            "%.git/",
            "%__pycache__/",
            "%.pytest_cache/",
            "%.ruff_cache/",
            "%.venv/"
          }
        },
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      }
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
      local tsbuiltin = require("telescope.builtin")

      -- Find files
      vim.keymap.set("n", "<leader>fd", function()
        tsbuiltin.find_files {
          hidden = true,
          no_ignore = true
        }
      end)

      -- Find help tags
      vim.keymap.set("n", "<leader>fh", tsbuiltin.help_tags)

      -- Edit Neovim config files
      vim.keymap.set("n", "<leader>en", function()
        tsbuiltin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)

      -- Find Buffers
      vim.keymap.set("n", "<leader>fb", function()
        tsbuiltin.buffers({ sort_mru = true })
      end)

      -- Find Neovim Lazy packages
      vim.keymap.set("n", "<leader>ep", function()
        tsbuiltin.find_files {
          ---@diagnostic disable-next-line: param-type-mismatch
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)

      -- Find files inside a virtual environment dir
      vim.keymap.set("n", "<leader>ev", function()
        local candidates = { ".venv", "venv", ".env", "env" }
        local cwd = vim.fn.getcwd()
        local venv_path = nil

        for _, name in ipairs(candidates) do
          local path = vim.fs.joinpath(cwd, name)
          if vim.fn.isdirectory(path) == 1 then
            venv_path = path
            break
          end
        end

        if not venv_path then
          vim.notify("No virtual environment directory found in " .. cwd, vim.log.levels.WARN)
          return
        end

        require("telescope.builtin").find_files {
          cwd = venv_path,
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = {}, -- don’t skip venv dirs
        }
      end)

      require("plugins.telescope.multigrep").setup()
    end
  }
}
