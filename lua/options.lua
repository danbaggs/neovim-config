vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.list = true -- show tab characters and trailing whitespace
vim.opt.cursorline = true

-- Line Wrapping
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true -- enable true color support

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Plugin options
-- Nvim-Tree Explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
