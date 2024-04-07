return {
  -- add gruvbox
  { "natecraddock/workspaces.nvim",
    opts = {
      path = vim.fn.stdpath("data") .. "/workspaces",
      cd_type = "global",
      sort = true,
      mru_sort = true,
      hooks = {
        open = { "Telescope find_files" },
        },
    },
  },
}