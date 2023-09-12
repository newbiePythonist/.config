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

-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.completion.completionItem.snippetSupport = false

for _,server in ipairs(servers) do
	require('lspconfig')[server].setup {
        capabilities = {
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = false,
                    },
                },
            },
        },
    }
end
