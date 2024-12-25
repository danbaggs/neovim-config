-- Python formatter
return {
  {
    'psf/black',
    ft = 'python',
  },
  {
    "fisadev/vim-isort",
    ft = "python",
    config = function()
      -- Disable default key binding
      vim.g.vim_isort_map = ''

      -- Automatically format file buffer when saving
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = "*.py",
        callback = function()
          vim.cmd("Black")
          vim.cmd("Isort")
        end,
      })
    end
  },
  {
    -- https://github.com/mfussenegger/nvim-dap-python
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      -- https://github.com/mfussenegger/nvim-dap
      'mfussenegger/nvim-dap',
    },
    config = function()
      -- Update the path passed to setup to point to your system or virtual env python binary
      require('dap-python').setup('/usr/bin/python3')
    end
  }
}
