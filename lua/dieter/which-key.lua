local ok, mymod = pcall(require, 'which-key')
if not ok then
    print("Module whichkey had an error")
else
     local function config()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
    return config()
end
