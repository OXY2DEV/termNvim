-- Mason
require("mason").setup({
	ui = {
		width = 1,
		height = 1,

		border = "rounded",

		icons = {
			pacakge_installed = " ",
			package_pending = " ",

			package_uninstalled = " "
		},
	}
});
require("mason-lspconfig").setup({
	ensure_installed = { "html", "cssls", "tsserver" },
})
