-- Plugin keymaps

--Telescope keymaps in telescope.lua

-- Oil file browser
vim.keymap.set("n", "-", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)

-- nvim-comment
vim.keymap.set({ "n", "v" }, "<leader><leader>c", ":CommentToggle<cr>")

-- Git-blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Twilight Code Block Highlighting
vim.keymap.set("n", "<leader>tw", ":Twilight<CR>")
-- Copilot
vim.keymap.set("n", "<leader>cpe", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cpd", ":Copilot disable<CR>")
vim.keymap.set("n", "<leader>cpco", ":CopilotChatOpen<CR>")
vim.keymap.set("n", "<leader>cpcc", ":CopilotChatClose<CR>")
