local gradient = {};
local _num = math.random(1, 6);

local colHelper = function(from, to, amount)
	local _c = {};
	local _r = math.abs((from[1] - to[1]) / (amount / 2));
	local _g = math.abs((from[2] - to[2]) / (amount / 2));
	local _b = math.abs((from[3] - to[3]) / (amount / 2));

	local _cR = from[1] > to[1] and to[1] or from[1];
	local _cG = from[2] > to[2] and to[2] or from[2];
	local _cB = from[3] > to[3] and to[3] or from[3];
	

	for i = 1, (amount / 2), 1 do
		local str = string.format("#%02X%02X%02X", math.floor(_cR), math.floor(_cG), math.floor(_cB));
		if #str > 7 then
			print(_g);
		end
		table.insert(_c, str)
	
		_cR = _cR + _r;
		_cG = _cG + _g;
		_cB = _cB + _b;
	end

	for i = 1, (amount / 2), 1 do
		local str = string.format("#%02X%02X%02X", math.floor(_cR), math.floor(_cG), math.floor(_cB));
		table.insert(_c, str)
	
		_cR = _cR - _r;
		_cG = _cG - _g;
		_cB = _cB - _b;
	end

	return _c
end

if _num == 1 then
	gradient = colHelper({8, 80, 119}, {131, 216, 206}, 20);
elseif _num == 2 then
	gradient = colHelper({31, 65, 56}, {151, 241, 199}, 20);
elseif _num == 3 then
	gradient = colHelper({36, 198, 219}, {80, 73, 156}, 30);
elseif _num == 4 then
	gradient = colHelper({255, 253, 230}, {0, 90, 168}, 20);
elseif _num == 5 then
	gradient = colHelper({63, 44, 150}, {168, 193, 255}, 20);
elseif _num == 6 then
	gradient = colHelper({51, 51, 51}, {220, 24, 24}, 20);
elseif _num == 6 then
	gradient = colHelper({36, 103, 219}, {80, 73, 156}, 20);
end

--print(#require("spaceport.data").getMruData());










vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "SpaceportEnter",
	callback = function()
		vim.opt.statuscolumn = ""
	end
})

local utf8 = require("utf8");
local artLine = 1;

local artToTable = function(lines, highlights)
	local _o = {};
	local _s = 1;

	for lIndex, line in ipairs(lines) do
		local _l = {};
		local _t = string.gmatch(line, utf8.charpattern);

		local _i = _s;

		for letter in _t do
			table.insert(_l, { letter, colorOpts = { fg = highlights[_i] } });

			if _i + 1 > #highlights then
				_i = 1;
			else
				_i = _i + 1;
			end
		end

		table.insert(_o, _l);

		if _s + 1 > #highlights then
			_s = 1;
		else
			_s = _s + 1;
		end

		artLine = artLine + 1;
	end

	return _o
end



local art = artToTable(require("ascii").get_random("text", "neovim"), gradient);

require("spaceport").setup({
	sections = { 
		{
			lines = art
		},
		"r",
		"remaps"
	},

	historySize = 15,
	textCol = { { 186, 194, 222 }, { 88, 91, 112 } },
	icons = {
		{ ".lua", " ", { fg = "#89b4fa" } },
		{ ".zshrc", " ", { fg = "#a6e3a1" } },
	},

	signCol = {
		today = { fg = "#74c7ec" },
		yesterday = { fg = "#94e2d5" },

		pastWeek = { fg = "#f9e2af" },
		pastMonth = { fg = "#fab387" },

		later = { fg = "#f5c2e7" }
	},

	top = #art + 1,
})
