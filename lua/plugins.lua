-- 💤 Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Options
local plugins = {
	{
		"preservim/nerdcommenter",

		config = function()
			require("plugins/commenter");
		end
	},

	{
		"roobert/activate.nvim",

		dependencies = {
			{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }
		}
	},
	{
		"williamboman/mason.nvim",
		enabled = false,

		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			require("plugins/mason");
		end
	},
	{
		"neovim/nvim-lspconfig",

		dependencies = {
		},

		config = function()
			require("plugins/lsp");
		end
	},
	{
		"hrsh7th/nvim-cmp",

		dependencies = {
			"onsails/lspkind.nvim",

			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"f3fora/cmp-spell",
			"FelipeLema/cmp-async-path",
			"mmolhoek/cmp-scss",
			"hrsh7th/cmp-nvim-lua",
			"p00f/clangd_extensions.nvim",
			"ray-x/cmp-treesitter",
			
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",

				dependencies = {
					"rafamadriz/friendly-snippets"
				},

				config = function()
					require("plugins/luasnip");
				end,
				build = "make install_jsregexp"
			},
			"saadparwaiz1/cmp_luasnip",
			
			"windwp/nvim-autopairs"
		},

		config = function()
			require("plugins/cmp");
		end
	},
	{
		"hedyhli/outline.nvim",

		config = function()
			require("plugins/outline");
		end
	},
	{
		"stevearc/aerial.nvim",
		enabled = false,

		config = function()
			require("plugins/aerial");
		end
	},
	{
		"j-hui/fidget.nvim",

		config = function()
			require("plugins/fidget");
		end
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
  	version = "*",

		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons"
		},

		config = function()
			require("plugins/barbecue");
		end
	},
	{
		"nmac427/guess-indent.nvim",

		config = function()
			require("plugins/guessIndent");
		end
	},
	{
		"windwp/nvim-autopairs",

		config = function()
			require("plugins/autopairs");
		end
	},


	{ -- This plugin
	  "Zeioth/compiler.nvim",
	  cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
	  dependencies = { "stevearc/overseer.nvim" },
	  opts = {},
	},
	{ -- The task runner we use
	  "stevearc/overseer.nvim",
	  --commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
		version = "1.3.0",
	  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	  opts = {
		  task_list = {
	      direction = "bottom",
		    min_height = 25,
			  max_height = 25,
				min_width = 0.2,
				max_width = 0.2,
	      default_detail = 2
		 },
	 },
	},











	{
		"OXY2DEV/spaceport.nvim",
		enabled = true,
		lazy = false,

		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"OXY2DEV/ascii.nvim",
			"uga-rosa/utf8.nvim"
		},

		config = function()
			require("plugins/spaceport");
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",

		dependencies = {
			"windwp/nvim-ts-autotag"
		},

		config = function()
			require("plugins/treesitter");
		end
	},
	{
		"rasulomaroff/reactive.nvim",

		config = function()
			require("plugins/reactive");
		end
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",

		config = function()
			require("plugins/flash");
		end
	},
	{
		"nvim-telescope/telescope.nvim", 
		tag = "0.1.5",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"ghassan0/telescope-glyph.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"debugloop/telescope-undo.nvim",
		},

		config = function()
			require("plugins/telescope");
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",

		config = function()
			require("plugins/whichKey");
		end
	},
	{
		"nvim-tree/nvim-web-devicons"
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("plugins/catppuccin");
		end
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugins/dressing");
		end
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",

		dependencies = {
			{
				"MunifTanjim/nui.nvim"
			},
			{
				"rcarriga/nvim-notify",
			}
		},

		config = function()
			require("plugins/noice");
		end
	},
	{
		"gelguy/wilder.nvim",
		enabled = false, -- Need to add support for NUI

		config = function()
			require("plugins/wilder");
		end
	},
	{
		"OXY2DEV/windline.nvim",
		name = "windline",
	  priority = 1000,
		enabled = true,

		config = function()
			require("plugins/windline");
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		--enabled = false,

		config = function()
			require("plugins/ibl");
		end
	},
	{
		"luukvbaal/statuscol.nvim",
		enabled = false,
		
		config = function()
			require("plugins/statuscol")
		end
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",

		dependencies = {
			"luukvbaal/statuscol.nvim",
			"kevinhwang91/promise-async"
		},

		config = function()
			require("plugins/ufo");
		end
	},

	{
		"echasnovski/mini.nvim",
		version = false,

		config = function()
			require("plugins/mini");
		end
	},

	{
		"OXY2DEV/muren.nvim",

		config = function()
			require("plugins/muren");
		end
	},

	{
		"declancm/cinnamon.nvim",

		config = function()
			require("plugins/cinnamon");
		end
	},

	{
		"NvChad/nvim-colorizer.lua",

		config = function()
			require("plugins/colorizer");
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins/gitsigns");
		end
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",

		config = function()
			require("plugins/toggleterm");
		end
	}
};
local options = {
	ui = {
		size = {
			width = 0.9,
			height = 0.9
		},

		border = "rounded",
		title = "💤 Lazy.nvim",

		wrap = false,

		install = {
			colorscheme = { "quiet" }
		},

		icons = {
			cmd = "  ",

			config = "  ",
			event = "  ",
			ft = "  ",

			init = "  ",
			imports = "  ",

			keys = "  ",

			lazy = " ",
			loaded = " ",
			not_loaded = " ",

			plugin = "  ",
			runtime = "  ",
			require = "  ",

			source = " ",
			start = "",

			task = "  "
		}
	}
};


require("lazy").setup(plugins, options)
