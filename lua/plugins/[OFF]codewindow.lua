require("codewindow").setup({
	minimap_width = 30,

	screen_bounds = "background",
	window_border = "none",

	relative = "editor",
	events = {
		"TextChanged",
		"InsertLeave",

		"DiagnosticChanged",

		"FileWritePost",

		"TabEnter"
	}
})
