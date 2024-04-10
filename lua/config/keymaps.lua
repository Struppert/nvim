-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Filebrowser
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>f", "vim.cmd.NvimTreeRefresh<CR>") -- refresh
vim.keymap.set("n", "<leader>n", "vim.cmd.NvimTreeFindFile<CR>") -- search file

-- undotree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

--vim.api.nvim_set_keymap("n", "<leader>pv", "Neotree", { silent = true })
-- fuer unimpaired
vim.api.nvim_set_keymap("n", "<", "[", { silent = true })
vim.api.nvim_set_keymap("n", ">", "]", { silent = true })
vim.api.nvim_set_keymap("o", "<", "[", { silent = true })
vim.api.nvim_set_keymap("o", ">", "]", { silent = true })
vim.api.nvim_set_keymap("x", "<", "[", { silent = true })
vim.api.nvim_set_keymap("x", ">", "]", { silent = true })

vim.api.nvim_set_keymap("n", "C-<", "C-[", { silent = true })
vim.api.nvim_set_keymap("n", "C->", "C-]", { silent = true })

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "jk", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

local wk = require("which-key")

wk.register({
  ["<leader>g"] = {
    n = { "<cmd>Neogit<cr>", "Neogit" },
    --r = { "<cmd>OverseerRun<cr>", "OverseerRun" },
  },
})

wk.register({
  ["<leader>o"] = {
    name = "+overseer",
    o = { "<cmd>OverseerToggle<cr>", "OverseerToggle" },
    r = { "<cmd>OverseerRun<cr>", "OverseerRun" },
  },
})
