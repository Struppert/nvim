require("dieter.set")
require("dieter.remap")
require'impatient'.enable_profile()
--
-- ab hier kommen die Plugins:
--
require("dieter.lualine")
require("dieter.compiler-explorer")
require("dieter.unimpaired")
require("dieter.todo-comments")
require("dieter.wilder")
require("dieter.nvimtree")
require("dieter.toggleterm")
require("dieter.bufferline")
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,

}

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "lua", "vim", "help", "query", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true,
        },
    },
}


require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            --i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                --["<C-h>"] = "which_key"
                --}
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                    lsp_handlers = {
                        code_action = {
                            telescope = require('telescope.themes').get_dropdown({}),
                        },
                    },
                }
            }

            vim.opt.signcolumn = 'yes'

            local lsp = require('lsp-zero').preset({
                name = 'minimal',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })

            -- make sure this servers are installed
            -- see :help lsp-zero.ensure_installed()
            lsp.ensure_installed({
                'clangd',
                'rust_analyzer',
                'tsserver',
                'eslint',
            })

            -- don't initialize this language server
            -- we will use rust-tools to setup rust_analyzer
            lsp.skip_server_setup({ 'rust_analyzer' })

            -- the function below will be executed whenever
            -- a language server is attached to a buffer
            lsp.on_attach(function(client, bufnr)
                print('Greetings from on_attach')
            end)

            -- pass arguments to a language server
            -- see :help lsp-zero.configure()
            lsp.configure('tsserver', {
                on_attach = function(client, bufnr)
                    print('hello tsserver')
                end,
                settings = {
                    completions = {
                        completeFunctionCalls = true
                    }
                }
            })

            local rt = require("rust-tools")

            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
            })
            local sign = function(opts)
                vim.fn.sign_define(opts.name, {
                    texthl = opts.name,
                    text = opts.text,
                    numhl = ''
                })
            end

            sign({name = 'DiagnosticSignError', text = ''})
            sign({name = 'DiagnosticSignWarn', text = ''})
            sign({name = 'DiagnosticSignHint', text = ''})
            sign({name = 'DiagnosticSignInfo', text = ''})

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                update_in_insert = true,
                underline = true,
                severity_sort = false,
                float = {
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
                },
            })

            vim.cmd([[
            set signcolumn=yes
            autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
            ]])

            -- share configuration between multiple servers
            -- see :help lsp-zero.setup_servers()
            lsp.setup_servers({
                'eslint',
                'angularls',
                opts = {
                    single_file_support = false,
                    on_attach = function(client, bufnr)
                        print("I'm doing web dev")
                    end
                }
            })

            -- configure lua language server for neovim

            -- see :help lsp-zero.nvim_workspace()
            lsp.nvim_workspace()

            lsp.setup()

            -- Setup nvim-cmp.
            local cmp = require 'cmp'

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
                    end,
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.recently_used,
                        require("clangd_extensions.cmp_scores"),
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                mapping = {
                    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            require 'cmp'.setup {
                sources = {
                    { name = 'nvim_lsp' }
                }
            }

            -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
            --local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- wird von clangd_extensions uebernommen.
            -- The following example advertise capabilities to `clangd`.
            --require 'lspconfig'.clangd.setup {
                --    capabilities = capabilities,
                --}
                --
                -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
                -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup { capabilities = capabilities}


                -- Global mappings.
                -- See `:help vim.diagnostic.*` for documentation on any of the below functions
                vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
                vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

                -- Use LspAttach autocommand to only map the following keys
                -- after the language server attaches to the current buffer
                vim.api.nvim_create_autocmd('LspAttach', {
                    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                    callback = function(ev)
                        -- Enable completion triggered by <c-x><c-o>
                        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                        -- Buffer local mappings.
                        -- See `:help vim.lsp.*` for documentation on any of the below functions
                        local opts = { buffer = ev.buf }
                        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                        vim.keymap.set('n', '<space>wl', function()
                            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end, opts)
                        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                        vim.keymap.set('n', '<space>f', function()
                            print("format")
                            vim.lsp.buf.format { async = true }
                        end, opts)
                    end,
                })

                require('dieter.overseer')
                require("dieter.hover")
                require("dieter.trouble")
                --require("dieter.cmake-tools")

                require("dieter.nvim-neoclip")
                require('telescope').load_extension('neoclip')

                -- muss hier nicht geladen werden
                require("telescope").load_extension('harpoon')

                require("dieter.clangd_extensions")
                require("dieter.rainbow2")
                require("dieter.myluasnip")

                require("dieter.workspaces")
                require('telescope').load_extension('workspaces')

                require("dieter.sessions")
                require("dieter.legendary")
                --require("dieter.which-key")

                require('telescope').load_extension('lsp_handlers')

                require('dieter.mybqf')
                require("dieter.mytabout")
                require("dieter.mynull-ls")
                require('leap').add_default_mappings()
                require('dieter.mytextobjects')
                local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

                -- Repeat movement with ; and ,
                -- ensure ; goes forward and , goes backward regardless of the last direction
                vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
                vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

                -- vim way: ; goes to the direction you were moving.
                -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
                -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

                -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
                vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
                vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
                vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
                vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
                vim.cmd('colorscheme gruvbox-material')

