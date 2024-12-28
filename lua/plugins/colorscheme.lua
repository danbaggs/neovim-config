return {
  -- {
  --   "shaunsingh/nord.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("nord")
  --     -- require("nord").load()
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin")
  --     require("catppuccin").setup({
  --       flavour = "frappe",
  --       transparent_background = true,
  --       styles = {
  --         comments = { "italic" },
  --         functions = { "bold" },
  --       },
  --     })
  --
  --     require("catppuccin").load()
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("tokyonight")
  --     require("tokyonight").setup({
  --       style = "moon",
  --       transparent = true,
  --     })
  --     require("tokyonight").load()
  --   end,
  -- },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      vim.cmd.colorscheme("onedark")
      require("onedark").setup({
        transparent = true,
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'bold',
          strings = 'none',
          variables = 'none'
        },
        highlights = {
          ["@variable"] = { fg = '$red' }
        }
      })
      require("onedark").load()
    end
  },
}
