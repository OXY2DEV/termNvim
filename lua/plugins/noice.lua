require("noice").setup({
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%"
			},

			size = {
				width = "75%",
				height = "auto",
			}
		},

		popupmenu = {
			relative = "editor",

			position = {
				row = 8,
				col = "50%"
			},
			size = {
				width = "75%",
				height = 15
			},

			border = {
				style = "rounded",
				padding = { 0, 0 },
			},

			win_options = {
				winblend = 10,
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      }
		}
	}
})
