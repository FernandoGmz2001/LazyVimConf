-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set("n", "<Esc>", ":noh<CR>")
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
keymap.set("n", "<leader>e", "<cmd>Neotree reveal right<CR>", { desc = "Dismiss Noice Message" })
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set('n', '<C-a>', "gg<S-v>G")
keymap.set('n', '<a-h>', "#")
keymap.set('n', '<a-l>', "*")
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })
