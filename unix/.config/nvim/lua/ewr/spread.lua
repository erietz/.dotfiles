-- https://hiphish.github.io/blog/2020/12/31/spreading-tables-in-lua/

local M = {}

local function deep_copy(object)
	if type(object) ~= "table" then
		return object
	end

	local result = {}
	for key, value in pairs(object) do
		result[key] = deep_copy(value)
	end
	return result
end

---Adds all of the values from the template table into the passed in table.
---This is useful for example for providing a set of default options.
---@param template table
---@return function
function M.spread(template)
	return function(table)
		local result = {}
		for key, value in pairs(template) do
			result[key] = deep_copy(value)
		end

		for key, value in pairs(table) do
			result[key] = value
		end
		return result
	end
end

return M
