return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup(
        {
          columns = { "icon" },
          view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
              local m = name:match("^%.DS_Store")
              return m ~= nil
            end,
          },
        }
      )
    end,
  },
}
