-- Shortcuts
local _w = require("windline");
local _u = require("windline.utils");

local _a = require("wlanimation");
local _e = require("wlanimation.effects");

local _s = _G.WindLine.state;

-- Variables
local _c = {};

local _uS = 15;
local _aS = vim.api.nvim_win_get_width(0);

local graph = "_";
local _wS = 0;

local _t = os.date("*t");

-- Randon seed
math.randomseed(os.time())

local textAnimation = function()
end

local createAnimation = function()
	local _col = { "#a6e3a1", "#70e0be", "#3cd9de", "#38cef5", "#6ebefd", "#38cef5",	"#3cd9de", "#70e0be", "#a6e3a1"	};

	if _wS == 0 or _wS == 5 then
		_col = _col;

		_wS = _wS + 1;
	elseif _wS == 1 or _wS == 6 then
		_col = {
			"#1e1e2e", "#264b63", "#1f7e8d", "#4eb2a0", 
			"#a6e3a1", 
			"#4eb2a0", "#1f7e8d", "#264b63", "#1e1e2e"
		}

		_wS = _wS + 1;
	elseif _wS == 2 or _wS == 7 then
		_col = {
			"#1e1e2e", "#38425b", "#4f6a8b", "#6397bc", 
			"#74c6ec",
			"#6397bc", "#4f6a8b", "#38425b", "#1e1e2e"
		}
		
		_wS = _wS + 1;

	elseif _wS == 3 or _wS == 8 then
		_col = {
			"#1e1e2e", "#413d5c", "#695f8e", "#9782c2", 
			"#caa6f7",
			"#9782c2", "#695f8e", "#413d5c", "#1e1e2e"
		}
		
		_wS = _wS + 1;
	elseif _wS == 4 or _wS == 9 then
		_col = {
			"#1e1e2e", "#45465a", "#70738a", "#9da3be",
			"#cdd6f4", 
			"#9da3be", "#70738a", "#45465a","#1e1e2e",
		}
		
		_wS = _wS + 1;
	else
		_col = _col;
		_wS = 0;
	end

	_a.stop_all();

	if _wS <= 4 then
		_a.animation({
			data = {
				{ "g1", _e.list_color(_col, 1)},
				{ "g2", _e.list_color(_col, 2)},
				{ "g3", _e.list_color(_col, 3)},
				{ "g4", _e.list_color(_col, 4)},
				{ "g5", _e.list_color(_col, 5)},
				{ "g6", _e.list_color(_col, 6)},
				{ "g7", _e.list_color(_col, 7)},
				{ "g8", _e.list_color(_col, 8)},
				{ "g9", _e.list_color(_col, 9)},
			},

			interval = 150,
			timeout = 500
		})
	else
		_a.animation({
			data = {
				{ "g1", _e.list_color(_col, 1)},
				{ "g2", _e.list_color(_col, 2)},
				{ "g3", _e.list_color(_col, 3)},
				{ "g4", _e.list_color(_col, 4)},
				{ "g5", _e.list_color(_col, 5)},
				{ "g6", _e.list_color(_col, 4)},
				{ "g7", _e.list_color(_col, 3)},
				{ "g8", _e.list_color(_col, 2)},
				{ "g9", _e.list_color(_col, 1)},
			},

			interval = 150,
			timeout = 500
		})
	end
end

vim.defer_fn(function()
	createAnimation();
	textAnimation();
end, 100)


_u.change_mode_name({
	["n"] = { "  N ", "Normal" },
	["no"] = { "  N ", "Normal" },

	["v"] = { "  v ", "Visual" },
	["V"] = { "  V ", "Visual" },
	[""] = { "  V ", "VisualB" },

	["i"] = { "  i ", "Insert" },

	["R"] = { "  R ", "Replace" },

	["c"] = { "  C ", "Command" },
	
	["t"] = { "  T ", "Command" },
	["nt"] = { "  N ", "Normal" }
})

_c.mode = {
	name = "mode",

	hl_colors = {
		Normal = { "fgN", "bgN" },
		
		Visual = { "fgV", "bgV" },
		VisualB = { "fgVB", "bgVB" },
		
		Insert = { "fgI", "bgI" },

		Replace = { "fgR", "bgR" },
		Command = { "fgC", "bgC" },
	},

	hl = function()
		return _s.mode[2];
	end,
	text = function()
		_uS = 15;
		_uS = _uS + 5;

		return _s.mode[1];
	end
};
_c.mode_sep = {
	name = "mdSep",
	
	hl_colors = {
		Normal = { "bgF", "bgN" },
		
		Visual = { "bgF", "bgV" },
		VisualB = { "bgF", "bgVB" },
		
		Insert = { "bgF", "bgI" },

		Replace = { "bgF", "bgR" },
		Command = { "bgF", "bgC" },
	},

	hl = function()
		return _s.mode[2];
	end,
	text = function()
		_uS = _uS + 1;

		return "";
	end
};

_c.name = {
	name = "file_name",

	hl_colors = { "fgF", "bgF" },

	text = function()
		local _n = vim.fn.expand("%:p:t");
		local _t = vim.o.filetype;
		local _i = "   ";

		if (_t == "lua") then
			_i = "   ";
		end

		if (_n == "") then
			_n = "New File";
		elseif (_n:len() >= 12) then
			_n = string.sub(_n, 1, 12);
		elseif (_n:len() < 12) then
			for i = 1, 8 - _n:len(), 1 do
				_n = _n .. " ";
			end
		end

		_uS = _uS + string.len("aaaa" .. _n .. " ");

		return _i .. _n .. " ";
	end
};

_c.gap = { "%=", { "fg", "bg" }}; 

_c.ruler = {
	name = "ruler",

	hl_colors = { "fgF", "bgF" },

	text = function()
		local _x = vim.api.nvim_win_get_cursor(0)[2];
		local _y = vim.api.nvim_win_get_cursor(0)[1];

		local _wX = "";
		local _wY = "";

		if _x < 10 then
			_wX = "   " .. _x;
		elseif _x >= 10 and _x < 100 then
			_wX = "  " .. _x;
		elseif _x >= 100 and _x < 1000 then
			_wX = " " .. _x;
		elseif _x >= 10000 then
			_wX = _x / 10000;
		end

		if _y < 10 then
			_wY = "   " .. _y;
		elseif _y >= 10 and _y < 100 then
			_wY = "  " .. _y;
		elseif _y >= 100 and _y < 1000 then
			_wY = " " .. _y;
		elseif _y >= 10000 then
			_wY = _y / 10000;
		end
		
		_uS = _uS + string.len("aaa" .. _wY .. "aaa" .. _wX .. " ");

		return " 󰺾 " .. _wY .. "  " .. _wX .. " ";
	end
};

_c.wnSep = {
	name = "nameWaveSeparator",

	hl_colors = { "bg", "bgF" },

	text = function()
		_uS = _uS + 1;

		return "";
	end
};

_c.wrSep = {
	name = "waveRulerSeparator",

	hl_colors = { "bg", "bgF" },

	text = function()
		_uS = _uS + 1;

		return "";
	end
};

_c.wave = {
	text = function()
		_aS = vim.api.nvim_win_get_width(0) - _uS;

		local _style = { "g1", "g2", "g3", "g4", "g5", "g6", "g7", "g8", "g9" };
		local _out = {};

		local _cI = 1;

		for i = 1, _aS - 1, 1 do
			if _cI < table.getn(_style) then
				_cI = _cI + 0.25;
			else
				_cI = 1;
			end


			_out[i] = { "_", { _style[math.floor(_cI)], "bg"}};
		end

		return _out;
	end,

	click = createAnimation
};

_c.cIcon = {
	text = function()
		local h = _t["hour"];
		local i = "     ";

		if h > 4 and h <= 6 then
			return " ";
		elseif h > 6 and h <= 16 then
			return " ";
		elseif h > 16 and h <= 18 then
			return " ";
		elseif h > 18 and h <= 20 then
			return " ";
		elseif h > 22 or h <= 2 then
			return " ";
		else
			return " ";
		end
	end,

	hl_colors = { "g5", "bgF" },
}

_c.clock = {
	text = function()
		local h = _t["hour"];
		local m = _t["min"];

		if m < 10 then
			m = "0" .. m;
		end

		if h <= 12 then
			return h .. ":" .. m;
		else
			h = (h - 12);
			return h .. ":" .. m;
		end
	end,

	hl_colors = { "f1", "bgF" },
}

_c.edgeL = {
	text = function()
		return " "
	end,
	hl_colors = { "bg", "bgF" },
}

_c.edgeR = {
	text = function()
		return " "
	end,
	hl_colors = { "bg", "bgF" },
}

-- Statusline
local _s1 = {
	filetypes = { "default" },

	active = { _c.mode, _c.mode_sep, _c.name, _c.wnSep, _c.wave, _c.gap, _c.wrSep, _c.ruler },
	inactive = { _c.mode, _c.mode_sep, _c.name, _c.wave, _c.gap, _c.ruler }
};

local _s2 = {
	filetypes = {
		"spaceport", 
		"toggleterm", 
		"OverseerList", 
		"terminal",
		"",
	},

	active = { _c.gap, _c.edgeL, _c.cIcon, _c.clock, _c.edgeR, _c.gap },
	inactive = { _c.gap, _c.clock },
}

-- Setup
_w.setup({
	global_skip_filetypes = {
		"spaceport", 
		"toggleterm", 
		"OverseerList", 
		"terminal",
	},
	colors_name = function(_cl)
		_cl.g1 = "#a6e3a1";
		_cl.g2 = "#70e0be";
		_cl.g3 = "#3cd9de";
		_cl.g4 = "#38cef5";
		_cl.g5 = "#6ebefd";
		_cl.g6 = "#38cef5";
		_cl.g7 = "#3cd9de";
		_cl.g8 = "#70e0be";
		_cl.g9 = "#a6e3a1";

		_cl.fg = "#cdd6f4";
		_cl.bg = "#1e1e2e";
		
		_cl.f1 = "#bac2de";
		_cl.b1 = "#11111b";
		
		_cl.f2 = "#cdd6f4";
		_cl.b2 = "#1e1e2e";
		
		_cl.bt = "#000000";
		
		_cl.fgF = "#9399b2";
		_cl.bgF = "#313244";

		_cl.bgN = "#89b4fa";
		_cl.fgN = "#11111b";

		_cl.fgI = "#11111b";
		_cl.bgI = "#cdd6f4";

		_cl.fgV = "#11111b";
		_cl.bgV = "#a6e3a1";
		
		_cl.fgVB = "#11111b";
		_cl.bgVB = "#94e2d5";

		_cl.fgR = "#11111b";
		_cl.bgR = "#f5c2e7";

		_cl.fgC = "#11111b";
		_cl.bgC = "#f9e2af";

		return _cl
	end,

	statuslines = {
		_s1,
		_s2,
	},

	tabline = {
		template = { 
			normal = { "", { "f1", "b1" } },
			select = { "", { "f2", "b2" } },

			normal_start = { "", { "bt", "b1" } },
			normal_end = { "", { "bt", "b1" } },

			normal_icon = { "", { "f1", "b1" } },
			normal_fill = { " ", { "b1", "b1" } },

			select_start = { "", { "bt", "b2" } },
			select_end = { "", { "bt", "b2" } },
			
			select_icon = { "", { "g1", "b2" } },
			select_fill = { " ", { "b2", "b2" } },

			normal_select = { "", { "bt", "b1" } },
			normal_last = { "", { "bt", "b1" } },
			select_last = { "", { "bt", "b2" } }
		},

		tab_end = {
			{ "%=", { "bt", "bt" } }
		}
	}
})



