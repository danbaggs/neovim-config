-- space bar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Half page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true }) -- Half page up
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true }) -- Half page down

-- Sourcing files during development
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>") -- Reload init.lua when you're editting it
vim.keymap.set("n", "<leader>x", ":.lua<CR>")                 -- Run the current .lua file
vim.keymap.set("v", "<leader>x", ":lua<CR>")                  -- In Visual Mode, run the current line

-- Buffer management
vim.keymap.set("n", "gd", "<cmd>bdelete<CR>") -- Previous buffer

-- Code reference actions
vim.keymap.set("n", "grn", vim.lsp.buf.rename)         -- Rename all instances of this item in the file
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)    -- Load all available code actions for the highlighted element
vim.keymap.set("n", "grr", vim.lsp.buf.references)     -- Find all references of the current element and load them into QuickFix
vim.keymap.set("n", "grd", vim.lsp.buf.definition)     -- Go to the definition of the current element
vim.keymap.set("n", "gri", vim.lsp.buf.implementation) -- Go to the implementation of the current element

-- Clear highlighting
vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>") -- Clear all highlighting

-- Diff keymaps
vim.keymap.set("n", "<leader>cc", ":diffput<CR>")   -- put diff from current to other during diff
vim.keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
vim.keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
vim.keymap.set("n", "<leader>cn", "]c")             -- next diff hunk
vim.keymap.set("n", "<leader>cp", "[c")             -- previous diff hunk

-- Quickfix keymaps
vim.keymap.set("n", "<leader>qo", ":copen<CR>")  -- open quickfix list
vim.keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
vim.keymap.set("n", "<leader>qn", ":cnext<CR>")  -- jump to next quickfix list item
vim.keymap.set("n", "<leader>qp", ":cprev<CR>")  -- jump to prev quickfix list item
vim.keymap.set("n", "<leader>ql", ":clast<CR>")  -- jump to last quickfix list item
vim.keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- Debugging
vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>bl",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
vim.keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", '<leader>dd', function()
  require('dap').disconnect(); require('dapui').close();
end)
vim.keymap.set("n", '<leader>dt', function()
  require('dap').terminate(); require('dapui').close();
end)
