-- Shortcuts
local O = vim.o;
local G = vim.g;
local A = vim.api;

-- Keymap timeout
O.timeoutlen = 500

-- Spelling
O.spell = true
O.spelllang = "en_us"

-- Required by some plugins(Filetype detection)
vim.cmd([[filetype plugin on]])

-- Enable 24-bit RGB colors
O.termguicolors = true

-- Mouse support
O.mouse = "ni"

-- Text wrap
O.wrap = false

-- Line numbers
O.number = true
O.numberwidth = 1
--O.statuscolumn = "Hi"

O.relativenumber = true

-- TODO: Check what this does
O.signcolumn = "yes"

-- TODO: Fix folds
O.foldcolumn = "1"

O.foldlevel = 99
foldlevelstart = 99

O.foldenable = true
O.foldmethod = "marker"

O.fillchars = [[eob: ,foldopen:󰿆,foldsep: ,foldclose:]]


-- Markers
O.cursorline = true
O.cursorlineopt = "number,line"

O.ruler = true
O.rulerformat = "%l %c"

-- Indentation
O.cindent = true
O.cinkeys = "0{,0},0),0],0>,:,0#,!^F,o,O,e"

O.smartindent = true

-- Tabs & Spaces
O.expandtab = true

O.tabstop = 2
O.shiftwidth = 2

O.softtabstop = 2

-- Commandline
O.cmdheight = 0
