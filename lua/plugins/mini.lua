local _m = require("mini.map");

require("mini.map").setup({
	integrations = {
		_m.gen_integration.builtin_search(),
		_m.gen_integration.diagnostic()
	},
	symbols = {
		encode = require("mini.map").gen_encode_symbols.dot("4x2"),

		scroll_line = "",
		scroll_view = ""
	},

	window = {
		focusable = true,

		width = 20,
		winblend = 75
	}
})

