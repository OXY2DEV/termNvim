local _b = require("telescope.builtin");
local _t = require("telescope");
local _p = require("telescope.previewers");

local _a = require("telescope._extensions.file_browser.actions");
local _ta = require("telescope.actions");
local _ua = require("telescope-undo.actions");

_t.setup({
	defaults = {
		previewer = true,
		file_preview = _p.vim_buffer_cat.new,

		layout_strategy = "vertical",
		layout_config = {
			width = 0.95,
			height = 0.90
		},
		winblend = 15,

		mappings = {
			n = {
				["<leader>?"] = "which_key"
			}
		}
  },
	extensions = {
		file_browser = {
			path = "%:p:h",
			previewer = true,
			layout_strategy = "flex",

			mappings = {
				["n"] = {
					["<CR>"] = _ta.select_tab,
				},
				["i"] = {
					["<CR>"] = _ta.select_tab,
				
					["<leader>c"] = _a.create,
					["<leader>r"] = _a.rename,
					["<leader>m"] = _a.move,
					["<leader>y"] = _a.copy,
					["<leader>d"] = _a.remove,
					["<leader>b"] = _a.toggle_browser,
					["<leader>h"] = _a.toggle_hidden,
					["<leader>b"] = _a.toggle_browser,
					["<C-h>"] = "which_key"
				}
			}
		},

		undo = {
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.6
			},

			mappings = {
				i = {
					["<CR>"] = _ua.restore,
					["<TAB>"] = _ua.yank_additions,
				},

				n = {
					["r"] = _ua.restore,
					["y"] = _ua.yank_additions,
					["r"] = _ua.yank_deletions
				}
			}
		}
	}
})

-- Extensions
_t.load_extension "frecency"
_t.load_extension "glyph"
_t.load_extension "file_browser"
_t.load_extension "undo"
_t.load_extension "ascii"
