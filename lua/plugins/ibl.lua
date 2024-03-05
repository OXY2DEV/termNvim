local iblHighlights = {
	"ibl_1",
}

local colors = {
	"#3e4b6b",
}

local hooks = require("ibl.hooks");
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	for index,color in ipairs(iblHighlights) do
		vim.api.nvim_set_hl(0, color, { fg = colors[index] })
	end
	
	vim.api.nvim_set_hl(0, "ibl_s", { fg = "" })
end)

require("ibl").setup({
	exclude = {
		buftypes = {
			"terminal",
			"spaceport"
		}
	},
	indent = {
		char = "│",

		highlight = iblHighlights
	},
	scope = {
		char = "┃",
		highlight = iblHighlights,

		enabled = true
	}
})
