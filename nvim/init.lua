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
set.smartindent = true
set.cursorline = true
set.termguicolors = true
set.incsearch = true
set.showcmd = true
set.wrap = false
set.hlsearch = false
set.ttimeoutlen = 0
set.timeoutlen = 500
set.completeopt = 'menu,menuone,noselect'
set.lazyredraw = true
set.scrolloff = 22
set.wildmode = 'full:longest'
-- set.path = '**,.*'
-- set.swapfile = false

cmd [[
    so ~/.config/nvim/vimscript/autocmds.vim
    so ~/.config/nvim/vimscript/customFunctions.vim
    so ~/.config/nvim/vimscript/mappings.vim
    so ~/.config/nvim/vimscript/tabLine.vim

    luafile ~/.config/nvim/lua/resetLspSyntax.lua
    hi Comment gui=none
    hi CursorLine gui=none
    hi Cursor guibg=grey60

    set guicursor=a:block-Cursor
    set signcolumn=no
    set inccommand=nosplit
    set shell+=\ -O\ globstar\ -O\ dotglob
]]

-- dirvish settings
g.dirvish_relative_path = 0
g.dirvish_mode = ':sort ,^.*[\\/],'

-- netrw settings
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_keepdir = 0
g.netrw_winsize = 25

-- vim move
g.move_key_modifier = 'C'
g.move_key_modifier_visualmode = 'C'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazyNvim')
require('plugins.cmp')
require('plugins.lspkind')
require('plugins.autopairs')
require('plugins.nvimTree')

cmd [[ colo edge ]]
