-- This file can be loaded by calling 'lua require('plugins')' from your init.vim

-- Only required if you have packer configured as 'opt'

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    -- Telescope (File Searching)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'}
		}
	}

    -- Gruvbox (Rust Style Theme)
	use {
		'morhetz/gruvbox',
		config = function() vim.cmd.colorscheme("gruvbox") end
	}

    -- Nvim Tree (Sidebar File Explore)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
    }

    -- Treesitter, better syntax highlighting and understanding
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

    -- LspZero (Language Server Features) Definitions, Completion, Debugging
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- LSP Managment Packages
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}


    -- Debugging tools (DAP & Config)
    use 'mfussenegger/nvim-dap'
    use {
        'jay-babu/mason-nvim-dap.nvim',
        requires = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap'
        }
    }
    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            'msfussenegger/nvim-dap'
        }
    }


    -- The Primeagen's Harpoon Plug for Quick File Marking and Nav
    use 'ThePrimeagen/harpoon'
    
end)
