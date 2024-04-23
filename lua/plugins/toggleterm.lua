return {
  -- amongst your other plugins
  -- { "akinsho/toggleterm.nvim", version = "*", config = true },
  -- or
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      shell = "powershell",
      close_on_exit = true,
      terminal_command = 'powershell -NoExit -Command "& { . $PROFILE } "',
    },
  },
}
