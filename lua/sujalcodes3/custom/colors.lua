function ColorMyPencils(color)
    color = color or "sonokai"
    vim.g.sonokai_enable_bold = true
    vim.g.sonokai_enable_italics = true
    vim.g.sonokai_style = "atlantis"
    vim.cmd.colorscheme(color)
    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
