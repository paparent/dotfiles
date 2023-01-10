local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use({
	'rebelot/kanagawa.nvim',
	config = function()
	    vim.cmd('colorscheme kanagawa')
	end
    })

    use {
	'nvim-treesitter/nvim-treesitter',
	run = function()
	    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	    ts_update()
	end,
    }

    use { 'theprimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'tpope/vim-sleuth' }

    use {
	'numToStr/Comment.nvim',
	config = function()
	    require('Comment').setup()
	end
    }

    use {
	'VonHeikemen/lsp-zero.nvim',
	requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-nvim-lua'},

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},
	    {'rafamadriz/friendly-snippets'},
	}
    }

    use { 'j-hui/fidget.nvim' }

    use { 'alexghergh/nvim-tmux-navigation', config = function()
	require'nvim-tmux-navigation'.setup {
	    disable_when_zoomed = true, -- defaults to false
	    keybindings = {
		left = "<C-h>",
		down = "<C-j>",
		up = "<C-k>",
		right = "<C-l>",
		last_active = "<C-\\>",
		next = "<C-Space>",
	    }
	}
    end}

    if packer_bootstrap then
	require('packer').sync()
    end
end)

