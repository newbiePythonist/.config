-- vsnip jumping options
vim.cmd "imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'"
vim.cmd "smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'"
vim.cmd "imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'"
vim.cmd "smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'"

-- local kind_icons = {
-- 	Variable = "v",
-- 	Function = "f",
-- }

-- Setup nvim-cmp.
local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup({
	completion = {
		completeopt = 'menu,menuone,noinsert',
	},
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
		end,
	},
	experimental = {
		ghost_text = false,
	},
	view = {
		entries = 'native',
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			before = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					vsnip = "[Vsnip]",
					buffer = "[Buffer]",
					path = "[Path]",
					spell = "[Spell]"
				})[entry.source.name]
				return vim_item
			end
		})
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'spell' },
		{ name = 'cmdline' },
	},
	-- window = {
	-- 	documentation = {
	-- 		cmp.config.window.bordered()
	-- 	},
	-- },
})

local servers = {
    -- 'pyright',
    'jedi_language_server', -- pip3 install jedi jedi_language_server
    'bashls',
    'lua_ls',
    -- 'vimls',
    -- 'sumneko_lua',
}

for _,server in ipairs(servers) do
	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
	require('lspconfig')[server].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
