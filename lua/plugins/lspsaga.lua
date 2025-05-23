return {
  "nvimdev/lspsaga.nvim",

  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enabled = true,
        sign = false,
        virtual_text = true,
        -- Priority of the gutter sign
        priority = 10,
      },
      code_action = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
        show_server_name = true,
        extend_gitsigns = true,
      },
      use_saga_diagnostic_sign = true,
      error_sign = "",
      warn_sign = "",
      hint_sign = "",
      infor_sign = "",
      dianostic_header_icon = "   ",
      code_action_icon = " ",
      code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
      },
      finder_definition_icon = "  ",
      finder_reference_icon = "  ",
      max_preview_lines = 10,
      finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
      },
      code_action_keys = {
        quit = "q",
        exec = "<CR>",
      },
      rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
      },
      definition_preview_icon = "  ",
      border_style = "single",
      rename_prompt_prefix = "",
      server_filetype_map = {},
    })
  end,
}
