require("lazy").setup({

    { 'LazyVim/LazyVim', event = 'VeryLazy' },

    -- colorschemes
    { 'sainnhe/sonokai', event = 'VeryLazy' },
    { 'bluz71/vim-nightfly-guicolors', event = 'VeryLazy' },
    { 'wadackel/vim-dogrun', event = 'VeryLazy' },
    { 'sainnhe/everforest', event = 'VeryLazy' },
    { 'embark-theme/vim', event = 'VeryLazy' },
    { 'sainnhe/edge', event = 'VeryLazy' },
    { 'arzg/vim-colors-xcode', event = 'VeryLazy' },
    { 'frenzyexists/aquarium-vim', event = 'VeryLazy' },
    { 'ayu-theme/ayu-vim', event = 'VeryLazy' },

    { 'junegunn/fzf.vim', event = 'VeryLazy' },
    { 'junegunn/fzf', event = 'VeryLazy' },

    -- completion + snippets
    { 'hrsh7th/nvim-cmp', event = 'VeryLazy' },
    { 'hrsh7th/cmp-nvim-lsp', event = 'VeryLazy' },
    { 'hrsh7th/vim-vsnip', event = 'VeryLazy' },
    { 'rafamadriz/friendly-snippets', event = 'VeryLazy' },
    { 'hrsh7th/cmp-vsnip', event = 'VeryLazy' },
    { 'hrsh7th/cmp-buffer', event = 'VeryLazy' },
    { 'hrsh7th/cmp-path', event = 'VeryLazy' },
    { 'onsails/lspkind.nvim', event = 'VeryLazy' },
    -- { 'hrsh7th/cmp-cmdline', event = 'VeryLazy' },

    -- lsp support
    { 'neovim/nvim-lspconfig', event = 'VeryLazy' },
    { 'williamboman/nvim-lsp-installer', event = 'VeryLazy' },

    -- { 'justinmk/vim-dirvish', event = 'VeryLazy' },
    { 'nvim-tree/nvim-tree.lua', event = 'VeryLazy' },
    { 'tpope/vim-surround', event = 'VeryLazy' },
    { 'windwp/nvim-autopairs', event = 'VeryLazy' },
    { 'j5shi/CommandlineComplete.vim', event = 'VeryLazy' },
    -- { 'sheerun/vim-polyglot', event = 'VeryLazy' },
})
