function ColorMyPencils(color)
	color = color or "vague"

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"vague2k/vague.nvim",
		name = "vague",
		config = function()
			require("vague").setup({
				transparent = true,
				style = {
					boolean = "bold",
					number = "none",
					float = "none",
					error = "none",
					comments = "italic",
					conditionals = "none",
					functions = "none",
					headings = "bold",
					operators = "italic",
					strings = "italic",
					variables = "none",

					-- keywords
					keywords = "bold",
					keyword_return = "bold",
					keywords_loop = "bold",
					keywords_label = "bold",
					keywords_exception = "bold",

					-- builtin
					builtin_constants = "bold",
					builtin_functions = "bold",
					builtin_types = "bold",
					builtin_variables = "bold",
				},
			})
			vim.cmd.colorscheme("vague")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function() end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function() end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		name = "oxocarbon",
	},
	{
		"aliqyan-21/darkvoid.nvim",
		name = "darkvoid",
	},
}
