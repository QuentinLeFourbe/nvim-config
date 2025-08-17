vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_set_keymap("n", "<C-D>", "<C-D>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-U>", "<C-U>zz", { noremap = true, silent = true })

vim.g.clipboard = {
	name = "clip.exe",
	copy = {
		["+"] = "clip.exe",
	},
	paste = {
		["+"] = "powershell.exe -command Get-Clipboard",
	},
	cache_enabled = true,
}

-- -- Copy to clipboard
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to clipboard" })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+yg_', { noremap = true, silent = true, desc = "Copy to clipboard" })
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy to clipboard" })
vim.api.nvim_set_keymap("n", "<leader>yy", '"+yy', { noremap = true, silent = true, desc = "Copy to clipboard" })

-- -- Paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true, silent = true, desc = "Past from clipboard" })
vim.api.nvim_set_keymap("n", "<leader>P", '"+P', { noremap = true, silent = true, desc = "Past from clipboard" })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true, silent = true, desc = "Past from clipboard" })
vim.api.nvim_set_keymap("v", "<leader>P", '"+P', { noremap = true, silent = true, desc = "Past from clipboard" })
