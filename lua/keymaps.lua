-- Helper functions
function map(mode, key, action, options)
	local _opts = {
		noremap = true,
		silent = true
	};

	if options then
		_defs = vim.tbl_extend("force", _opts, options);
	end

	vim.keymap.set(mode, key, action, _opts);
end

-- Keymap related settings
vim.g.mapleader = " ";

-- Movement
map("n", "<leader>w", ":w<CR>");
map("n", "<leader>q", ":q<CR>");

map("n", "<leader>qq", ":q!<CR>");
map("n", "<leader>wq", ":wq<CR>");

-- Tab switching
map("n", "<leader>,", ":tabprevious<CR>");
map("n", "<leader>.", ":tabnext<CR>");

-- Lazy
map("n", "<leader>l", ":Lazy<CR>");
map("n", "<leader>p", ":lua require('activate').list_plugins()<CR>");

-- Telescope
map("n", "<leader>?", ":Telescope frecency<CR>");
map("n", "<leader>g", ":Telescope glyph<CR>");
map("n", "<leader>f", ":Telescope file_browser<CR>");
map("n", "<leader>s", ":Telescope find_files<CR>");
map("n", "<leader>u", ":Telescope undo<CR>");
map("n", "<leader>h", ":Telescope highlights<CR>");

-- Minimap
map("n", "<leader>m", ":lua require('mini.map').toggle()<CR>");
map("n", "<leader>m<leader>", ":lua require('mini.map').toggle_side()<CR>");

map("n", "<leader>o", ":Outline<CR>");

-- Barbecue
map("n", "<leader>b", ":Barbecue toggle<CR>");

-- Replace
map("n", "<leader>r", ":lua require('muren.api').open_ui()<CR>");

-- Compiler
map("n", "<leader>c", ":CompilerOpen<CR>");

-- Terminal
map("n", "<leader>t", ":ToggleTerm<CR>");
map("n", "<leader>tl", ":lua require('toggleterm').exec('lazygit')<CR>");
map("n", "<leader>tn", ":lua require('toggleterm').exec('npm run dev')<CR>");
