return {
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function(_, opts)
      local sg = require("sg")
      sg.setup(opts)
    end,
    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",
    --[[
    opts = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = cmp.config.sources({
          { name = "cody" },
          { name = "nvim_lsp" },
        }),
        mapping = {
          -- Manually trigger cody completions
          ["<c-a>"] = cmp.mapping.complete({
            config = {
              sources = {
                { name = "cody" },
              },
            },
          }),
        },
      })
    end,
    keys = {
      {
        "<c-a>",
        "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<cr>",
        desc = "sourcegraph fuzzy_search_results",
      },
    },
  ]]
  },
}
