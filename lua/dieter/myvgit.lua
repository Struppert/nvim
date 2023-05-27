local ok, mymod = pcall(require, 'vgit')
if not ok then
    print("Module vgit had an error")
else
mymod.setup()
end


