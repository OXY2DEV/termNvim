--require("fidget").setup()
--vim.lsp.set_log_level("info")

-- Lsp supported buffers
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP something something",
	callback = function(event)
		local opts = { buffer = event.buf };

		vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.definition(); end, opts);
	end
})
