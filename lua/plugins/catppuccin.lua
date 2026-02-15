return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
			},
			color_overrides = {},
			custom_highlights = function(colors)
				return {
					CmpItemMenu = { fg = colors.surface2 },
					CmpItemAbbrMatch = { fg = colors.blue, style = { "bold" } },
					CmpItemAbbrMatchFuzzy = { fg = colors.blue, style = { "bold" } },
					LineNrAbove = { fg = colors.lavender },
					LineNr = { fg = colors.teal, style = { "bold" } },
					LineNrBelow = { fg = colors.lavender },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
