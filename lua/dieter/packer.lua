-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use({
        'sainnhe/gruvbox-material',
        as = 'gruvbox-material',
        config = function()
            vim.cmd('colorscheme gruvbox-material')
        end
    })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',

        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
            'antosha417/nvim-lsp-file-operations',
            'echasnovski/mini.base16',
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use({"folke/trouble.nvim"})

    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("tpope/vim-repeat")
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")


    -- use {'stevearc/overseer.nvim'}
    use {'hrsh7th/nvim-cmp'}
    use {'sar/cmp-lsp.nvim'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'quangnguyen30192/cmp-nvim-ultisnips'}
    use {'ggandor/leap.nvim'}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {'nvim-treesitter/nvim-treesitter-context'}

    use {
        'HallerPatrick/py_lsp.nvim',
        -- Support for versioning
        -- tag = "v0.0.1" 
    }

    use {'krady21/compiler-explorer.nvim'}
    use {'stevearc/dressing.nvim'};
    use {'rcarriga/nvim-notify'};

    use {"folke/which-key.nvim"}
    use {"tummetott/unimpaired.nvim"}
    use {"folke/todo-comments.nvim"}
    use {'sindrets/diffview.nvim'}
    use {'gelguy/wilder.nvim'}

    use {'dbeniamine/cheat.sh-vim'}
    use {'Civitasv/cmake-tools.nvim'}

    use {'roxma/nvim-yarp'}
    use {"kkharji/sqlite.lua"}
    use {"AckslD/nvim-neoclip.lua"}

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()  require("toggleterm").setup() end}

    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

end)
