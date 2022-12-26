-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
})

local api = require("nvim-tree.api")
vim.keymap.set("n", "q", function() api.tree.toggle() end)
