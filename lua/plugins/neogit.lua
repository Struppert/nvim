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
        integrations = {
          diffview = true, -- Aktiviert die Integration mit diffview.nvim
        },
      })
    end,
  },
}
