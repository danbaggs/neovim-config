vim.opt.clipboard = "unnamedplus" -- use system clipboard for yank/put
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.list = true -- show tab characters and trailing whitespace
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.scrolloff = 5

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

vim.g.python3_host_prog = '~/.config/nvim/.venv/bin/python3'
