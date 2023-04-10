--nvim/lua/overseer/template/user/msbuild.lua
return {
    name = "msbuild",
    builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        local path = vim.fn.path()
        vim.api.nvim_echo(path)
        return {
            cmd = {"msbuild", file},
            cwd =  vim.fn.expand("%:p:h"),
            args = {"/property:GenerateFullPaths=true", "/t:build",},
            components = { { "on_output_quickfix", open = true }, "default" },
        }
    end,
}

