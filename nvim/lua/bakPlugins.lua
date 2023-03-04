return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'flazz/vim-colorschemes',
		requires = {
			'ghifarit53/tokyonight-vim',
			'joshdick/onedark.vim',
			'drewtempelmeyer/palenight.vim'

		}

	}
	-- use 'ghifarit53/tokyonight-vim'
	-- use 'joshdick/onedark.vim'

	use {
		'hrsh7th/vim-vsnip',
		requires = 'rafamadriz/friendly-snippets',
	}
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/nvim-cmp'

	use {
		'mattn/emmet-vim',
		opt = true,
		ft = {'html'}
	}
	use {
		'matze/vim-move',
	}
end)
