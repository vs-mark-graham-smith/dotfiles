local util = require("tokyonight.util")
local colors = require("tokyonight.colors")

require("tokyonight").setup({
    style = "night",
    on_highlights = function (highlights, colours)
        --[[
        --  Nvim Tree
        --]]--
        highlights.NvimTreeNormal = {
            bg = "NONE",
            fg = "NONE"
        }
        highlights.NvimTreeNormalNC = {
            bg = "NONE",
            fg = "NONE"
        }
    end
})

vim.cmd('colorscheme tokyonight')
