local servers = {
    -- 'jedi_language_server', -- pip3 install jedi jedi_language_server | apt install python3-jedi
    'pyright',
    'lua_ls',
    'html',
    'cssls',
    'intelephense',
    'tsserver',
    -- 'bashls',
}

for _,server in ipairs(servers) do
	require('lspconfig')[server].setup {
		on_attach = _G.lsp_on_attach,
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = false,
                    }
                }
            }
        },
	}
end
