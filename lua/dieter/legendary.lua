
local ok, mymod = pcall(require, 'legendary')
if not ok then
    print("Module legendary had an error")
else

    mymod.setup({
        keymaps = {
            -- erst das Zeug aus Telescope
            -- finder
            { '<leader>ff', ':Telescope find_files<CR>', description = 'Find files'                    },
            { '<leader>fg', ':Telescope live_grep<CR>',  description = 'live grep'                     },
            { '<leader>fb', ':Telescope buffers<CR>',    description = 'live buffers'                  },
            { '<leader>fh', ':Telescope help_tags<CR>',  description = 'telescope help'                },
            { '<leader>fn', ':Telescope neoclip<CR>',    description = 'telescope neoclip'             },
            -- sucht nach Dateien in nvim
            { '<leader>fa', function () require('telescope.builtin').find_files{cwd = '~/AppData/Local/nvim'} end, description = 'telescope find file in Home' },

            -- commands
            { '<leader>cc', ':Telescope commands<CR>',   description = 'telescope commands'            },
            { '<leader>ch', ':Telescope command_history<CR>', description = 'telescope command_history'},
            -- harpoon marks
            { '<leader>hm', ':Telescope harpoon marks<CR>', description = 'harpoon marks'},

            -- harpoon
            { '<leader>hca', ':lua require("harpoon.mark").add_file()<CR>',       description = 'harpoon add file'},
            { '<leader>hct', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',description = 'harpoon toggle_quick_menu'},
            { '<leader>hf', ':lua require("harpoon.ui").nav_file(1)<CR>',         description = 'harpoon nav_file 1'},
            { '<leader>hd', ':lua require("harpoon.ui").nav_file(2)<CR>',         description = 'harpoon nav_file 2'},
            { '<leader>hs', ':lua require("harpoon.ui").nav_file(3)<CR>',         description = 'harpoon nav_file 3'},
            { '<leader>ha', ':lua require("harpoon.ui").nav_file(4)<CR>',         description = 'harpoon nav_file 4'},
            { '<leader>hcn', ':lua require("harpoon.ui").nav_next()<CR>', description = 'harpoon nav_next'},
            { '<leader>hcp', ':lua require("harpoon.ui").nav_prev()<CR>', description = 'harpoon nav_prev'},

            -- TroubleToggle
            { '<leader>xx', ':TroubleToggle<CR>', description = 'TroubleToggle'},
            { '<leader>xw', ':TroubleToggle workspace_diagnostics', description = 'TroubleToggle workspace_diagnostics'},
            { '<leader>xd', ':TroubleToggle workspace_diagnostics<CR>', description = 'lua require("harpoon.ui").nav_prev()'},
            { '<leader>xl', ':TroubleToggle loclist<CR>', description = 'TroubleToggle loclist'},
            { '<leader>xq', ':TroubleToggle quickfix<CR>', description = 'TroubleToggle quickfix'},
            { '<leader>gR', ':TroubleToggle lsp_references<CR>', description = 'TroubleToggle lsp_references'},

            -- hover
            { '<leader>K', ':lua require("hover").hover()<CR>', description = 'Hover'},
            { '<leader>gK',':lua require("hover").hover_select()<CR>', description = 'Hover hover_select'},

            -- overseer
            { '<leader>oo', ':OverseerToggle<CR>', description = 'OverseerToggle'},
            { '<leader>or', ':OverseerRun<CR>', description = 'OverseerRun'},
            { '<leader>oc', ':OverseerRunCmd<CR>', description = 'OverseerRunCmd'},
            { '<leader>ol', ':OverseerLoadBundle<CR>', description = 'OverseerLoadBundle'},
            { '<leader>ob', ':OverseerBuild<CR>', description = 'OverseerBuild'},
            { '<leader>od', ':OverseerQuickAction<CR>', description = 'OverseerQuickAction'},
            { '<leader>ot', ':OverseerTaskAction<CR>', description = 'OverseerTaskAction'},

            --
            -- ab hier ist noch Baustelle
            --
            --
            -- map keys to a function
            --
            --{
            --    '<leader>h',
            --    function()
            --        print('hello world!')
            --    end,
            --    description = 'Say hello',
            --},
            -- Set options used during keymap creation
            { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = true } },
            -- create keymaps with different implementations per-mode
            --{
                --  '<leader>c',
                --  { n = ':LinewiseCommentToggle<CR>', x = ":'<,'>BlockwiseCommentToggle<CR>" },
                --  description = 'Toggle comment',
                --},
                --
                -- create item groups to create sub-menus in the finder
                -- note that only keymaps, commands, and functions
                -- can be added to item groups
                {
                    -- groups with same itemgroup will be merged
                    itemgroup = 'short ID',
                    description = 'A submenu of items...',
                    icon = '',
                    keymaps = {
                        -- more keymaps here
                    },
                },
                -- in-place filters, see :h legendary-tables or ./doc/table_structures/README.md
                { '<leader>m', description = 'Preview markdown', filters = { ft = 'markdown' } },
            },
            commands = {
                -- easily create user commands
                {
                    ':SayHello',
                    function()
                        print('hello world!')
                    end,
                    description = 'Say hello as a command',
                },
                {
                    -- groups with same itemgroup will be merged
                    itemgroup = 'short ID',
                    -- don't need to copy the other group data because
                    -- it will be merged with the one from the keymaps table
                    commands = {
                        -- more commands here
                    },
                },
                -- in-place filters, see :h legendary-tables or ./doc/table_structures/README.md
                { ':Glow', description = 'Preview markdown', filters = { ft = 'markdown' } },
            },
            funcs = {
                -- Make arbitrary Lua functions that can be executed via the item finder
                {
                    function()
                        doSomeStuff()
                    end,
                    description = 'Do some stuff with a Lua function!',
                },
                {
                    -- groups with same itemgroup will be merged
                    itemgroup = 'short ID',
                    -- don't need to copy the other group data because
                    -- it will be merged with the one from the keymaps table
                    funcs = {
                        -- more funcs here
                    },
                },
            },
            autocmds = {
                -- Create autocmds and augroups
                --{ 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
                --{
                    --  name = 'MyAugroup',
                    --  clear = true,
                    --  -- autocmds here
                    --},
                },
                -- load extensions
                extensions = {
                    -- load keymaps and commands from nvim-tree.lua
                    nvim_tree = true,
                    -- load commands from smart-splits.nvim
                    -- and create keymaps, see :h legendary-extensions-smart-splits.nvim
                    smart_splits = {
                        directions = { 'h', 'j', 'k', 'l' },
                        mods = {
                            move = '<C>',
                            resize = '<M>',
                        },
                    },
                    -- load commands from op.nvim
                    op_nvim = true,
                    -- load keymaps from diffview.nvim
                    diffview = true,
                },
            })


        end -- pcall


