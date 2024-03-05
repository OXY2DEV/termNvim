-- Snippets
require("luasnip.loaders.from_vscode").lazy_load({ include = { "javascript" } });

local snippet = require("luasnip");
local modes   = { "i", "s" };

function expand_or_jump()
	if snippet.expand_or_jumpable() then
		snippet.expand_or_jump()
	end
end

function jump_next()
	if snippet.jumpable(1) then
		snippet.jump(1)
	end
end

function jump_prev()
	if snippet.jumpable(-1) then
		snippet.jump(-1)
	end
end

vim.keymap.set(modes, "<C-s>", expand_or_jump, { silent = true });
vim.keymap.set(modes, "<C-right>", jump_next, { silent = true });
vim.keymap.set(modes, "<C-left>", jump_prev, { silent = true });


-- Helper functions
local lsp_capa = require("cmp_nvim_lsp").default_capabilities();
local def_setup = function(server)
	require("lspconfig")[server].setup({
		--on_attach = function(_, bufnr)
		--	local function buf_set_option(...)
    --		vim.api.nvim_buf_set_option(bufnr, ...)
  	--	end
		--end,
		capabilities = lsp_capa
	})
end


-- Servers
def_setup("tsserver");
def_setup("cssls");
def_setup("html");
def_setup("emmet_language_server");
def_setup("clangd");

def_setup("pylsp");

-- Types
local kinds = {
	Text = "󰦨 ",

	Method = " ",
	Function = "󰡱 ",

	Constructor = " ",
	Field = "󰽐 ",

	Variable = "󱀍 ",

	Class = " ",
	Interface = " ",
	Module = "󰕳 ",
	Property = " ",
	Struct = " ",

	Unit = " ",
	Value = " ",
	Constant = " ",
	Enum = " ",
	EnumMember = " ",

	Keyword = " ",
	Snippet = " ",
	Color = " ",

	File = " ",
	Folder = " ",
	Reference = " ",

	Event = "󰾋 ",
	Operator = " ",

	TypeParameter = " "
}

-- Completion menu setup
local cmp = require("cmp");
local cmp_select = { behavior = cmp.SelectBehavior.select };
local lspkind = require("lspkind");

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "treesitter" },
		{ name = "luasnip" },

		{ name = "buffer", keyword_length = 4 },
		--{ name = "spell" },
		{ name = "async_path", keyword_length = 4 },

		{
			name = "scss",
			option = {
				folders = { 
					"src/scss"
				}
			}
		},
		{ name = "nvim_lua" },
	},

	completion = {},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},

	formatting = {
		fields = { "kind", "abbr" },

		format = lspkind.cmp_format({
			--mode = "symbol",
			maxwidth = 20,

			ellipsis_char = "..",

			before = function(entry, vim_item)
				vim_item.kind = kinds[vim_item.kind] or "?";

				return vim_item;
			end
		})
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body);
		end
	},

	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-c>"] = cmp.mapping.complete(),

		["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
		["<Down>"] = cmp.mapping.select_next_item(cmp_select),

		["<C-Up>"] = cmp.mapping.scroll_docs(-4),
		["<C-Down>"] = cmp.mapping.scroll_docs(4),
		["<Left>"] = cmp.mapping.close(),
	}
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Setting Completion
--[[
vim.api.nvim_create_autocmd(
	{ "TextChangedI", "TextChangedP" },
	{
		callback = function()
			local line = vim.api.nvim_get_current_line();
			local cursor = vim.api.nvim_win_get_cursor(0)[2];

			local current = string.sub(line, cursor, cursor + 1)
      if current == "." or current == "," or current == " " then
        require('cmp').close()
      end

			local before_line = string.sub(line, 1, cursor + 1)
      if not string.match(before_line, '^%s+$') then
        if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
          require('cmp').complete()
        end
			end
		end,

		pattern = "*"
	}
)
]]--
