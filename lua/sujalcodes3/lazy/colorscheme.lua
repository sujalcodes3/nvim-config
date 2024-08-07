function ColorMyPencils(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "scottmckendry/cyberdream.nvim",
        name = "cyberdream",
        lazy = false,
        priority = 1000,
        config = function ()
            require("cyberdream").setup({
                transparent = true
            })
        end
    },
    {
        "luisiacc/gruvbox-baby",
        name = "gruvbox-baby",
        config = function()
            --vim.g.gruvbox_baby_transparent_mode = 1
            --vim.g.gruvbox_baby_telescope_theme= 1
            --vim.g.gruvbox_baby_function_style="NONE"
            --vim.g.gruvbox_baby_keyword_style="italic"
        end
    },
    {
        "rmehri01/onenord.nvim",
        name = "onenord",
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function() end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        name = "oxocarbon",

        config = function() end,
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        config = function()
            --ColorMyPencils("kanagawa")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        opts = ...,
        config = function() end,
    },
    {
        "projekt0n/caret.nvim",
        name = "caret",
        config = function() end,
    },
    {
        "ramojus/mellifluous.nvim",
        name = "mellifluous",
        config = function()
            --ColorMyPencils("mellifluous")
        end,
    },
    {
        dir = "~/.config/nvim/no-clown-fiesta.nvim",
        name = "no-clown-fiesta",
        config = function()
            --ColorMyPencils("no-clown-fiesta")
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        config = function()
            --ColorMyPencils("moonfly")
        end,
    },
}
