--vim.opt.guicursor = ""
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- powershell als default
vim.cmd([[
let &shell = executable('pwsh') ? 'powershell' : 'pwsh'
let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
:set shellquote= shellxquote=
]])

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.makeprg = "msbuild"
--vim.opt.colorcolumn = "80"
--
vim.o.ignorecase = true
vim.o.smartcase = true

vim.g.python_host_prog= ""

vim.g.python3_host_prog= "C:/Users/diete/.pyenv/pyenv-win/versions/3.11.0a4/python.exe"
vim.g.sqlite_clib_path= "c:/Users/diete/AppData/Local/nvim-data/databases/sqlite3.dll"
