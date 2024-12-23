-- Nvim-Tree Explorer
vim.keymap.set("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>") -- Toggle Nvim Tree view to left

-- Oil file browser
vim.keymap.set("n", "-", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)

-- nvim-comment
vim.keymap.set({ "n", "v" }, "<C-/>", ":CommentToggle<cr>")

--Telescope keymaps in telescope.lua

-- Git-blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame
