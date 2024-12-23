return {
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
  }
}
