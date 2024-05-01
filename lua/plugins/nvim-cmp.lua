return {
  "hrsh7th/nvim-cmp",
  dependencies = { "saadparwaiz1/cmp_luasnip", "onsails/lspkind.nvim" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local lspkind = require("lspkind")
    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }
    table.insert(opts.sources, { name = "luasnip" })
    table.insert(opts.sources, { name = "nvim_lua" })
    table.insert(opts.sources, { name = "nvim_lsp" })
    table.insert(opts.sources, { name = "treesitter" })
    opts.formatting = {
      format = lspkind.cmp_format({
        mode = "text",

        maxwidth = 80,
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        show_labelDetails = true,
        function(entry, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
            calc = "[Calc]",
            emoji = "[Emoji]",
            treesitter = "[Treesitter]",
          })[entry.source.name]
          return vim_item
        end,
      }),
    }
  end,
}
