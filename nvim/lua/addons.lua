return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

    -- colorschemes
    use {
        'sainnhe/sonokai',
        'bluz71/vim-nightfly-guicolors',
        'wadackel/vim-dogrun',
        'sainnhe/everforest',
        'embark-theme/vim',
        'sainnhe/edge',
        'arzg/vim-colors-xcode',
        'frenzyexists/aquarium-vim',
        'vim-scripts/mars.vim'
    }

    -- completion + snippets
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/vim-vsnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'onsails/lspkind.nvim',
		}
	}

    -- lsp support
	use {
		'neovim/nvim-lspconfig',
		requires = {
			'williamboman/nvim-lsp-installer',
		}
	}

    use 'justinmk/vim-dirvish'
    use 'tpope/vim-surround'
    use 'windwp/nvim-autopairs'
    -- use 'sheerun/vim-polyglot'

end)
