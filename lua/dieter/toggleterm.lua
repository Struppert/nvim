-- toggleterm-config.lua

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
 return
end

toggleterm.setup({
 size = 20,
 open_mapping = [[<c-\>]],
 hide_numbers = true,
 shade_filetypes = {},
 shade_terminals = true,
 shading_factor = 2,
 start_in_insert = true,
 insert_mappings = true,
 persist_size = true,
 close_on_exit = true,
})

--local powershell_options = {
--  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
--  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--  shellquote = "",
--  shellxquote = "",
--}

--for option, value in pairs(powershell_options) do
--  vim.opt[option] = value
--end


function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--local powershell_options = {
--  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
--  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--  shellquote = "",
--  shellxquote = "",
--}

--for option, value in pairs(powershell_options) do
--  vim.opt[option] = value
--end

local Terminal = require("toggleterm.terminal").Terminal

local posh = Terminal:new({cmd="powershell.exe -noexit"})
function _POSH_TOGGLE()
 posh:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _POSH_TOGGLE()<CR>", {noremap = true, silent = true})

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
 lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
 node:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
 python:toggle()
end
