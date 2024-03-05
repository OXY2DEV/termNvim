local keys = { close = "a" };
local actions = { close = 1 };


for key, value in pairs(keys) do
	local name = key;

	print(actions[name]);
end
