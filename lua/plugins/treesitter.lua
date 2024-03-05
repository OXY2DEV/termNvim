require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"vim",
		"lua",
		"html",
		"css",
		"javascript",

		"regex",
		"markdown",
		"bash",

		"vimdoc",
	},
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,

		--disable = { "html" }
	},

	indent = {
		enable = true
	}
})
