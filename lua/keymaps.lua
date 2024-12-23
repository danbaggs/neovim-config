-- space bar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>") -- Reload init.lua when you're editting it
vim.keymap.set("n", "<leader>x", ":.lua<CR>")                 -- Run the current .lua file
vim.keymap.set("v", "<leader>x", ":lua<CR>")                  -- In Visual Mode, run the current line

vim.keymap.set("n", "gn", "<cmd>bnext<CR>")                   -- Next buffer
vim.keymap.set("n", "gp", "<cmd>bprev<CR>")                   -- Previous buffer
vim.keymap.set("n", "gd", "<cmd>bdelete<CR>")                 -- Previous buffer

vim.keymap.set("n", "grn", vim.lsp.buf.rename)                -- Rename all instances of this item in the file
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)           -- Load all available code actions for the highlighted element
vim.keymap.set("n", "grr", vim.lsp.buf.references)            -- Find all references of the current element and load them into QuickFix

-- vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")              -- Next in the QuickFix list
-- vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")              -- Prev in the QuickFix list
vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>") -- Clear all highlighting

-- Diff keymaps
vim.keymap.set("n", "<leader>cc", ":diffput<CR>")   -- put diff from current to other during diff
vim.keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
vim.keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
vim.keymap.set("n", "<leader>cn", "]c")             -- next diff hunk
vim.keymap.set("n", "<leader>cp", "[c")             -- previous diff hunk
