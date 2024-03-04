vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<C-D>', '<C-D>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-U>', '<C-U>zz', { noremap = true, silent = true })


