
require("compiler-explorer").setup({
  url = "https://godbolt.org",
  infer_lang = true, -- Try to infer possible language based on file extension.
  binary_hl = "Comment", -- Highlight group for binary extmarks/virtual text.
  autocmd = {
    enable = false, -- Enable highlighting matching lines between source and assembly windows.
    hl = "Cursorline", -- Highlight group used for line match highlighting.
  },
  diagnostics = { -- vim.diagnostic.config() options for the ce-diagnostics namespace.
    underline = false,
    virtual_text = false,
    signs = false,
  },
  open_qflist = false, --  Open qflist after compilation if there are diagnostics.
  split = "split", -- How to split the window after the second compile (split/vsplit).
  spinner_frames = { "⣼", "⣹", "⢻", "⠿", "⡟", "⣏", "⣧", "⣶" }, -- Compiling... spinner settings.
  spinner_interval = 100,
  compiler_flags = "", -- Default flags passed to the compiler.
  job_timeout = 25000, -- Timeout for libuv job in milliseconds.
  languages = { -- Language specific default compiler/flags
    --c = {
    --  compiler = "g121",
    --  compiler_flags = "-O2 -Wall",
    --},
  },
})
