require("flash").setup({
	exclude = {
		"Spaceport",
		"cmp_menu",
		"noice",
		"flash_prompt",
		"Outline",

		function(win)
      -- exclude non-focusable windows
      return not vim.api.nvim_win_get_config(win).focusable
    end,
	},

	label = {
		rainbow = {
			enabled = true,
			shade = 9
		}
	}
})
