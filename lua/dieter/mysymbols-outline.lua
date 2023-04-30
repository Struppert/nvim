local ok, mymod = pcall(require, 'symbols-outline')
if not ok then
    print("Module symbols-outline had an error")
else
    mymod.setup()
end


