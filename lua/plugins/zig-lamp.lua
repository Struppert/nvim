return {
    "jinzhongjia/zig-lamp",
    event = "VeryLazy",
    build = ":ZigLamp build sync",
    -- or ":ZigLamp build" for async build, the build job will return immediately
    -- or ":ZigLamp build sync 20000" for sync build with specified timeout 20000ms
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
    },
    -- Here is default config, in general you no need to set these options
    init = function()
        -- if set this Non-negative value, zig-lamp will automatically install zls when open zig file.
        vim.g.zig_lamp_zls_auto_install = nil
        -- if set this Non-negative value, zig-lamp will fallback system zls when not found downloaded zls.
        vim.g.zig_lamp_fall_back_sys_zls = nil
        -- this is setting for zls with lspconfig, the opts you need to see document of zls and lspconfig.
        vim.g.zig_lamp_zls_lsp_opt = {}
        vim.g.zig_lamp_pkg_help_fg = "#CF5C00"
        vim.g.zig_lamp_zig_fetch_timeout = 5000
    end,
}
