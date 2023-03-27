return {
    {
	'echasnovski/mini.nvim',
	version = false,
	config = function()
	    require('mini.pairs').setup()
	    require('mini.cursorword').setup()
	    require('mini.trailspace').setup()
	end
    }
}
