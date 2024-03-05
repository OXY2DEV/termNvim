local _b = require("statuscol.builtin");
vim.api.nvim_set_hl(0, "statusSeparator", { fg="#7f849c" });
vim.api.nvim_set_hl(0, "FoldColumn", { fg="#b4befe" });

-- {{{
require("statuscol").setup({
	setopt = true,

	relculright = true,

	ft_ignore = { "help", "spaceport", "Outline" }, bt_ignore = { "Lazy" },
	config = function(_, opts)
	end,

	segments = {
		{ 
			text = { " ", _b.foldfunc }, 
			click = "v:lua.ScFa", 
			condition = { true, _b.notempty } 
		},
		{
      text = {
				-- {{{
        " ",
				_b.lnumfunc,
        " ",
				-- }}}
      },
      condition = {
        true,
        _b.notempty
      },
		},
		{ text = { "%#statusSeparator#%=▏" }, condition = { true, _b.notempty } },
	}
})
-- }}}
