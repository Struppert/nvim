return {
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = function()
      require("sg").setup({})
    end,
    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",
  },
}
