return {
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup({
                keys = {
                    ["$"] = {
                        escape = true,
                        close = true,
                        pair = "$$",
                        disabled_filetypes = {}
                    },
                },
            })
        end
    },
    "kylechui/nvim-surround",
    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
        config = function ()
            require("ibl").setup()
        end

    }
}

