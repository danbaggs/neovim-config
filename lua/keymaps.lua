-- space bar leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>") -- Reload init.lua when you're editting it
vim.keymap.set("n", "<leader>x", ":.lua<CR>")                 -- Run the current .lua file
vim.keymap.set("v", "<leader>x", ":lua<CR>")                  -- In Visual Mode, run the current line

-- vim.keymap.set("n", "gn", "<cmd>bnext<CR>")                   -- Next buffer
-- vim.keymap.set("n", "gp", "<cmd>bprev<CR>")                   -- Previous buffer
vim.keymap.set("n", "gd", "<cmd>bdelete<CR>")       -- Previous buffer

vim.keymap.set("n", "grn", vim.lsp.buf.rename)      -- Rename all instances of this item in the file
vim.keymap.set("n", "gra", vim.lsp.buf.code_action) -- Load all available code actions for the highlighted element
vim.keymap.set("n", "grr", vim.lsp.buf.references)  -- Find all references of the current element and load them into QuickFix

vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>")    -- Clear all highlighting

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

-- Plugin keymaps
-- Nvim-tree
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")   -- toggle file explorer
vim.keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>")    -- toggle focus to file explorer
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Oil file browser
vim.keymap.set("n", "-", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)

-- nvim-comment
vim.keymap.set({ "n", "v" }, "<C-/>", ":CommentToggle<cr>")

--Telescope keymaps in telescope.lua

-- Git-blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame
