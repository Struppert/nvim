--nvim/lua/overseer/template/user/echo.lua
return {
  name = "echo",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    return {
      cmd = {powershell.exe},
      args = {"-NoExit"},
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
}
