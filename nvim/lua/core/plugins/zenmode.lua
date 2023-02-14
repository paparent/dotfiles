return {
    {
	'folke/zen-mode.nvim',
	config = function()
	    require('zen-mode').setup()

	    vim.keymap.set('n', '<leader>z', function()
		require('zen-mode').toggle({
		    window = {
			options = {
			    cursorcolumn = false,
			    colorcolumn = "",
			}
		    }
		})
	    end)
	end
    }
}
