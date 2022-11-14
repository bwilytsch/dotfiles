require("base")
require("highlights")
require("maps")
require("plugins")

-- local has = function(x)
-- 	return vim.fn.has(x) == 1
-- end
--
-- local is_mac = has("macunix")
-- local is_linux = has("unix")

-- if is_linux then
-- 	require("linux")
-- end

local isMac = function()
    return vim.loop.os_uname().sysname == "Darwin"
end

if isMac then
	require("macos")
end

