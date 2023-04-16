local ok, mymod = pcall(require, 'null-ls')
if not ok then
    print("Module null-ls had an error")
else
    --local my_source = {}
    --my_source.filetypes = {}
    -- using setup method
    --mymod.setup({ sources = my_source })

    -- using register method
    --mymod.register({ my_source })
    mymod.setup({
        sources = {
            --mymod.builtins.formatting.stylua,
            mymod.builtins.diagnostics.clang_check,
            mymod.builtins.completion.spell,
            mymod.builtins.completion.luasnip,
            mymod.builtins.formatting.clang_format,
        },
    })
end
