vim.g.mapleader = " "

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Filebrowser
vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree)

-- undotree
vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

--vim.api.nvim_set_keymap("n", "<leader>pv", "Neotree", { silent = true })
-- fuer unimpaired
vim.api.nvim_set_keymap("n", "<", "[", { silent = true })
vim.api.nvim_set_keymap("n", ">", "]", { silent = true })
vim.api.nvim_set_keymap("o", "<", "[", { silent = true })
vim.api.nvim_set_keymap("o", ">", "]", { silent = true })
vim.api.nvim_set_keymap("x", "<", "[", { silent = true })
vim.api.nvim_set_keymap("x", ">", "]", { silent = true })
