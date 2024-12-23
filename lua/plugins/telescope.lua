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
      }
    },
    config = function()
      require("telescope").setup {
        extensions = {
          fzf = {}
        }
      }
      require("telescope").load_extension("fzf")
      local tsbuiltin = require("telescope.builtin")
      -- Find files
      vim.keymap.set("n", "<leader>fd", tsbuiltin.find_files)
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
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)
      require("plugins.telescope.multigrep").setup({})
    end
  }
}
