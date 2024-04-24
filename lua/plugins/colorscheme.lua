return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
      colorscheme = "neon_latte",
      integrations = {
        harpoon = true,
        neogit = true,
        overseer = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  -- Configure LazyVim to load gruvbox
  --[[
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
]]
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "gruvbox",
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "tokyonight",
    },
  },
}
