vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'joshdick/onedark.vim'

    use 'neovim/nvim-lspconfig'

    use {'neoclide/coc.nvim', branch = 'release'}
end)
