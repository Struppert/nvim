--vim.opt.guicursor = ""

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
