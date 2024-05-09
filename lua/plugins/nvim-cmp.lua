---@class MyCmpConfig
---@field snippet table
---@field sources table[]
---@field formatting table

return {
  "hrsh7th/nvim-cmp",
  dependencies = { "saadparwaiz1/cmp_luasnip", "onsails/lspkind.nvim", "zbirenbaum/copilot-cmp" },
  ---@param opts MyCmpConfig
  opts = function(_, opts)
    local lspkind = require("lspkind")

    -- Initialisierung von lspkind mit dem benutzerdefinierten Symbol für Copilot
    lspkind.init({
      symbol_map = {
        Copilot = "", -- Unicode-Symbol oder ein Icon Ihrer Wahl
      },
    })

    local cmp = require("cmp")

    -- Common snippet configuration
    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }

    -- Sources configuration including copilot
    opts.sources = cmp.config.sources({
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer", keyword_length = 4 },
      { name = "path" },
      { name = "treesitter" },
    })

    -- Formatting configuration
    opts.formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 80,
        ellipsis_char = "...",
        show_labelDetails = true,
        customize_item = function(entry, vim_item)
          -- Verwenden des benutzerdefinierten Symbols für Copilot
          vim_item.kind = lspkind.presets.default[vim_item.kind]
            or lspkind.symbol_map[vim_item.kind] .. " " .. vim_item.kind
          vim_item.menu = ({
            copilot = "[Copilot]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
            calc = "[Calc]",
            treesitter = "[Treesitter]",
          })[entry.source.name]
          return vim_item
        end,
      }),
    }

    -- Setup for Copilot-CMP (falls zusätzliche Einstellungen benötigt werden)
    require("copilot_cmp").setup({
      -- Hier können zusätzliche spezifische Einstellungen hinzugefügt werden
    })
  end,
}
