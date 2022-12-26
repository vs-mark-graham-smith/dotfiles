require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.intelephense.setup {
    on_attach = function(client, bufnr)
        vim.cmd('syntax on')
    end
}
require'lspconfig'.vuels.setup{}
