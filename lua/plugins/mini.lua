return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require "mini.animate".setup({
        scroll = { enable = false }
      })
      require "mini.icons".setup()
      require "mini.diff".setup()
      require "mini.git".setup()
      require "mini.move".setup()
      require "mini.pairs".setup()
      require "mini.surround".setup()
      require "mini.tabline".setup()
    end
  }
}
