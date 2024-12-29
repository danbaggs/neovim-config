return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 40,
        },
        renderer = {
          add_trailing = true,
          indent_markers = {
            enable = true
          }
        },
        filters = {
          custom =
          {
            ".DS_Store",
            ".cache",
            ".gitattributes"
          },
          dotfiles = false,
          git_ignored = false
        },
      })
    end
  }
}
