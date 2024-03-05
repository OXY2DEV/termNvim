local mode;

local git = vim.fs.find(".git", {
	limit = 1,
	upward = false,
  type = 'directory',
})

if #git == 0 then
	mode = "virtualtext"
else
	mode = "background";
end

print(mode)


require("colorizer").setup({
	user_default_options = {
		mode = mode
	}
})

