require("toggleterm").setup({
	direction = "float",
	persist_size = true,

	highlights = {
		FloatBorder = {
			guifg = "#89B4FA"
		},
		NormalBorder = {
			guifg = "#89B4FA"
		}
	},

	float_opts = {
		width = vim.api.nvim_win_get_width(0) - 4,
		height = vim.api.nvim_win_get_height(0) - 3,

		border = "rounded",
		winblend = 15,

		title_pos = "left"
	}
})


local _t = require("toggleterm");
--local lz = _t:new({ cmd = "lazygit", hidden = false })




