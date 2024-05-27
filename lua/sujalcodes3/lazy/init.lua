return {
    { 'nvim-lua/plenary.nvim', priority = 1000 },
    "christoomey/vim-tmux-navigator",
    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function ()
            require('lualine').setup {
                options = {
                    theme = 'sonokai',
                },
            }
        end
    },
    { 'nvim-tree/nvim-web-devicons', opts = true },
}
