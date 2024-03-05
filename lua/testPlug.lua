-- 💤 Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Options
local plugins = {
	{
		"luukvbaal/statuscol.nvim",
		
		config = function()
      --require("statuscol").setup();
			require("plugins/statuscol")
		end
	},
	{
		"rasulomaroff/reactive.nvim",
		enabled = true,

		config = function()
			require("plugins/reactive");
		end
	},
}

require("lazy").setup(plugins)
