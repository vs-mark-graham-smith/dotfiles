vim.api.nvim_set_keymap(
    'n',
    '<leader>pf',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    "<cmd>lua require('fzf-lua').git_files()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>pg',
    "<cmd>lua require('fzf-lua').live_grep()<CR>",
    { noremap = true, silent = true }
)
