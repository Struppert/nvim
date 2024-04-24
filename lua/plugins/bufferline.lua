return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = function(_, opts)
      opts.options.show_buffer_close_icons = false
      opts.options.show_close_icon = false
    end,
  },
}