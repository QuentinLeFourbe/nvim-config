return {
	"mfussenegger/nvim-lint",
	opts = {
		-- Event to trigger linters

		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
			-- Use the "*" filetype to run linters on all filetypes.
			-- ['*'] = { 'global linter' },

			-- Use the "_" filetype to run linters on filetypes that don't have other linters configured.

			-- ['_'] = { 'fallback linter' },
			-- ["*"] = { "typos" },
		},
	},
	config = function()
		require("lint").linters_by_ft = {
			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascriptreact = { "eslint_d" },
		}

		vim.opt.updatetime = 500
		vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
