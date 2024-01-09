return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
	'nvim-lua/plenary.nvim',
	{
	    'nvim-telescope/telescope-fzf-native.nvim',
	    build = 'make',
	    cond = vim.fn.executable 'make' == 1
	},
	'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
	pcall(require('telescope').load_extension, 'fzf')
	pcall(require('telescope').load_extension, 'file_browser')

	local builtin = require('telescope.builtin')

	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
	vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
	vim.keymap.set('n', '<leader>fr', builtin.resume, {})
	vim.keymap.set('n', '<leader>fv', require'telescope'.extensions.file_browser.file_browser, {})
	vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    end,
}
