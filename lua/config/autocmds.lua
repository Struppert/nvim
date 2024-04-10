-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end,
})

-- Die nächsten Zeilen sollen dafür sorgen, dass Fehlermeldungen im Quickfix richtig geparst werden.
vim.api.nvim_command("autocmd BufRead,BufNewFile *.sln set filetype=msbuild")
vim.api.nvim_command("autocmd BufRead,BufNewFile *.vcxproj set filetype=msbuild")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "msbuild", -- Muster, das mit dem Dateityp übereinstimmen soll
  callback = function()
    vim.opt_local.errorformat = '%A%*[%t[^]]%*]%*[ ]%f(%l\\,%c):%m,"%Z%*\\s%\\@=%m,"%-G%.%#' -- Konfiguration des errorformats
  end,
})
