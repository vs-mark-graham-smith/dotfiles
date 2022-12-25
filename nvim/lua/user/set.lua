-- Hybrid Line Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Colour Setup
vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')

-- Nice scroll x
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.opt.scrolloff = 10

--
vim.opt.wrap = false
vim.opt.hlsearch = false
