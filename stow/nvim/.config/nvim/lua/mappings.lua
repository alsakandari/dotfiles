require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd>w <cr>")
map("n", "<C-q>", "<cmd>q <cr>")

map("n", "<leader>fd", "<cmd>Telescope diagnostics <cr>", { desc = "telescope find diagnostics" })

unmap("n", "<C-n>")
unmap("n", "<leader>e")
