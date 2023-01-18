local keymap = function()
    vim.keymap.set(
        'n',
        'gd',
        vim.lsp.buf.definition,
        bufopts
    )
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
end

require'lspconfig'.rust_analyzer.setup{
    on_attach = keymap()
}
require'lspconfig'.intelephense.setup {
    on_attach = function(client, bufnr)
        vim.cmd('syntax on')
        keymap()
    end
}

require'lspconfig'.volar.setup{
    filetypes = {
        'typescript',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'vue',
        'json'
    }
}

require'lspconfig'.html.setup{}
