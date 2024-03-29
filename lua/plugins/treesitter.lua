return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
        ensure_installed = {"lua", "vim", "javascript", "typescript", "json", "html", "css"},
				auto_install = true,
				autotag = {
					enable = true,
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
  {
     "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require('nvim-ts-autotag').setup({
        -- your config
      })
    end,
  },}
