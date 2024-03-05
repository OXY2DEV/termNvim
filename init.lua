-- Change the package path so that Lua knows where to look for the packages
-- Check "Stackoverflow". No fix currently known.
package.path = "/data/data/com.termux/files/home/.config/nvim/?.lua";
--vim.opt.runtimepath:append(", /data/data/com.termux/files/home/.config/nvim/?.lua");

-- Globals
vim.g.WLtabnum = false;

-- Imports
require("lua/settings");
require("lua/keymaps");
require("lua/plugins");
require("lua/override");

--print("Hello Neovim");

