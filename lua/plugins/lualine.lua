return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    optional = true,
    opts = function(_, opts)
      local ovs = require("overseer")
      table.insert(opts.sections.lualine_c, {
        "aerial",
        sep = " ", -- separator between symbols
        sep_icon = "", -- separator between icon and symbol

        -- The number of symbols to render top-down. In order to render only 'N' last
        -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
        -- be used in order to render only current symbol.
        depth = 5,

        -- When 'dense' mode is on, icons are not rendered near their symbols. Only
        -- a single icon that represents the kind of current symbol is rendered at
        -- the beginning of status line.
        dense = false,

        -- The separator to be used to separate symbols in dense mode.
        dense_sep = ".",

        -- Color the symbol icons.
        colored = true,
      })
      table.insert(opts.sections.lualine_x, {
        "overseer",
        label = "", -- Prefix for task counts
        colored = true, -- Color the task icons and counts
        symbols = {
          [ovs.STATUS.FAILURE] = "F:",
          [ovs.STATUS.CANCELED] = "C:",
          [ovs.STATUS.SUCCESS] = "S:",
          [ovs.STATUS.RUNNING] = "R:",
        },
        unique = false, -- Unique-ify non-running task count by name
        name = nil, -- List of task names to search for
        name_not = false, -- When true, invert the name search
        status = nil, -- List of task statuses to display
        status_not = false, -- When true, invert the status search
      })
    end,
  },
}
