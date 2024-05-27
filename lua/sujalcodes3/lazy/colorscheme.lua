return {
    {
        "sainnhe/sonokai",
        name = "sonokai",
        config = function ()
            vim.g.sonokai_enable_italics = true
            vim.cmd.colorscheme("sonokai")
        end
    },
}

