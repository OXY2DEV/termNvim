local _r = require("reactive");

_r.add_preset({
	name = "my_preset",
	skip = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "" or vim.api.nvim_buf_get_option(0, "filetype") == "spaceport" or vim.api.nvim_buf_get_option(0, "filetype") == "" then
			return true; 
		else
			return false;
		end
	end,
	
	static = {
		winhl = {
			inactive = {
				CursorLine = { bg = "#222233" }
			}
		}
	},

	modes = {
		no = {
			operators = {
				d = {
					winhl = {
						CursorLine = { bg = "#3e2e40" }
					}
				},
				y = {
					winhl = {
						CursorLine = { bg = "#362e38" }
					}
				}
			}
		},
		n = {
			winhl = {
				CursorLine = { bg = "#2a2f45" }
			},
		},
		i = {
			winhl = {
				CursorLine = { bg = "#313244" }
			}
		},
		[{ 'v', 'V', '\x16' }] = {
			winhl = {
				Visual = { bg = "#2d343b" }
			}
		},
		R = {
			winhl = {
				CursorLine = { bg = "#363043" }
			}
		}
	}
})


--_r.load_preset("my_preset");
