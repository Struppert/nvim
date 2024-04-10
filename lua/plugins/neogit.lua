return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- für diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    opts = function()
      require("neogit").setup({
        -- Andere Konfigurationen für neogit hier
        -- usu ist muell 2000 (default) reicht hier nicht wir nehmen mal 5000
        console_timeout = 2000,
        -- Automatically show console if a command takes more than console_timeout milliseconds
        auto_show_console = false,
        integrations = {
          diffview = true, -- Aktiviert die Integration mit diffview.nvim
          telescope = true,
        },
      })
    end,
  },
}
