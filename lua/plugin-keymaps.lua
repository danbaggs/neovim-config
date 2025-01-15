-- Plugin keymaps

--Telescope keymaps in telescope.lua

-- Nvim-tree
-- vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")   -- toggle file explorer
-- vim.keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>")    -- toggle focus to file explorer
-- vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Oil file browser
vim.keymap.set("n", "-", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)

-- nvim-comment
vim.keymap.set({ "n", "v" }, "<leader><leader>c", ":CommentToggle<cr>")

-- Git-blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Copilot
vim.keymap.set("n", "<leader>cpe", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cpd", ":Copilot disable<CR>")
