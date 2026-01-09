return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({

			auto_integrations = true,

			custom_highlights = function(colors)
				return {
					LineNrAbove = { fg = colors.lavender },
					LineNr = { fg = colors.teal, style = { "bold" } },
					LineNrBelow = { fg = colors.lavender },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
