local _w = require("wilder");

-- Change the background color
vim.api.nvim_set_hl(0, "Pmenu", { bg="#1e1e2e" });
vim.api.nvim_set_hl(0, "PmenuSel", { bg="#45485b" });

local _s = {
	"#45a18e", "#3a9a8d", "#31938c", "#288c8a", "#208488", 
	"#1b7d85", "#187682", "#176e7e", "#186779", "#1a6074", 
	"#1d596f", "#1f5269", "#214b62", "#23445b", "#243d54", 
	"#24364d", "#233045", "#222a3d", "#202436", "#1e1e2e"
};
local _g = {
	"#35e99e", "#06dfa0", "#00d6a1", "#00cca1", "#00c2a1", 
	"#00b89f", "#00ae9d", "#00a49b", "#009a97", "#009093",
	"#00878e", "#007d88", "#007381", "#006a7a", "#006072", 
	"#005769", "#004e60", "#004557", "#083c4d", "#0f3443"
};

for i, color in ipairs(_g) do
	_g[i] = _w.make_hl("WilderGradient" .. i, "PmenuSel", { { a = 1 }, { a = 1 }, { foreground = color } })
end

for j, color in ipairs(_s) do
	_s[j] = _w.make_hl("WilderSGradient" .. j, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = color } })
end

_w.setup({
	modes = { ":", "?" },

	next_key = "<down>",
	previous_key = "<C-Up>",

	accept_key = "<tab>",
	reject_key = "<S-tab>"
})

_w.set_option("renderer", _w.popupmenu_renderer(
	_w.popupmenu_palette_theme({
		highlights = {
			gradient = _s,
			selected_gradient = _g
		},

		highlighter = _w.highlighter_with_gradient({
			_w.basic_highlighter();
		}),
		border = "rounded",

		position = {
			row = 23,
			col = "50%"
		},
		max_height = "25%", min_height = "25%",

		prompt_position = "bottom"
	})
))

