return {
  "hrsh7th/nvim-cmp",
  dependencies = { "sourcegraph/sg.nvim", "saadparwaiz1/cmp_luasnip" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, { name = "cody" })
    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }
    table.insert(opts.sources, { name = "luasnip" })
  end,
}
