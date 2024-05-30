function ColorMyPencils(color)
    color = color or "sonokai"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "sainnhe/sonokai",
        name = "sonokai",
        config = function ()
            vim.g.sonokai_enable_bold = true
            vim.g.sonokai_enable_italics = 1
            vim.g.sonokai_transparent_background = 1

            vim.cmd.colorscheme("sonokai")
            ColorMyPencils()
        end
    },
}

