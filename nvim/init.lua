-- aliases
local set = vim.opt
local g = vim.g
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local fn = vim.fg

-- changing leader key
g.mapleader = ' '

-- basic settings
set.nu = false
set.rnu = true
set.shiftwidth = 4
set.tabstop = 4
set.expandtab = true
set.cursorline = true
set.termguicolors = true
set.incsearch = true
set.showcmd = true
set.wrap = false
set.hlsearch = false
set.ttimeoutlen = 0
set.timeoutlen = 500
set.completeopt = 'menu,menuone,noselect'
set.lazyredraw=true
set.scrolloff = 22

cmd [[
    " so ~/.config/nvim/colors/delek.vim
    let g:dirvish_mode = ':sort ,^.*[\/],'
    colo nightfly
    hi Comment gui=none
    so ~/.config/nvim/vimscript/mappings.vim
    so ~/.config/nvim/vimscript/autocmds.vim

	set guicursor=a:block-Cursor
	set signcolumn=no
	set inccommand=nosplit
]]

-- netrw settings
g.netrw_banner = 0
g.netrw_liststyle = 0
g.netrw_keepdir = 0
g.netrw_winsize = 25

-- vim move
g.move_key_modifier = 'C'
g.move_key_modifier_visualmode = 'C'

require('addons')
require('plugins.cmp')
require('plugins.lspkind')
require('plugins.autopairs')
