
vim.g.mapleader = " "

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Filebrowser
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>f', 'vim.cmd.NvimTreeRefresh<CR>')       -- refresh
vim.keymap.set('n', '<leader>n', 'vim.cmd.NvimTreeFindFile<CR>')      -- search file

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


vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])


vim.api.nvim_set_keymap("n", "<leader>oo", "<cmd>OverseerToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>or", "<cmd>OverseerRun<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>oc", "<cmd>OverseerRunCmd<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>ol", "<cmd>OverseerLoadBundle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>ob", "<cmd>OverseerBuild<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>od", "<cmd>OverseerQuickAction<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>od", "<cmd>OverseerTaskAction<CR>", { silent = true })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

