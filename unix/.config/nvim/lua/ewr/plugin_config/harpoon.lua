local M = {}

-- Global variables to this file------------------------------------------------
local line_ending = nil
if vim.fn.has("win32") == 1 then
    line_ending = "\r\n"
else
    line_ending = "\n"
end

local filename = {
    ["absolute"] = vim.fn.expand("%:p"),
    ["dirname"] = vim.fn.expand("%:h"),
    ["basename"] = vim.fn.expand("%:t"),
    ["extension"] = vim.fn.expand("%:e"),
    ["root"] = vim.fn.expand("%:r"),
    ["root_absolute"] = vim.fn.expand("%:p:r"),
}

-- Local Functions--------------------------------------------------------------

local harpoon_filetype_map = {
    ["python"] = function()
        return "python " .. filename.absolute
    end,
    ["javascript"] = function()
        return "node " .. filename.absolute
    end,
    ["typescript"] = function()
        return "ts-node " .. filename.absolute
    end,
    ["lua"] = function()
        return "lua " .. filename.absolute
    end,
    ["c"] = function()
        return "gcc "..filename.absolute.." -o "..filename.root_absolute..
            " && "..filename.root_absolute
    end
}

local function get_harpoon_cmd()
    local filetype = vim.bo.filetype
    local cmd = harpoon_filetype_map[filetype]
    if cmd == nil then
        return nil
    else
        return cmd()
    end
end

-- Exported Functions-----------------------------------------------------------

function M.run_harpoon_cmd_and_navigate()
    local cmd = get_harpoon_cmd()
    if cmd == nil then
        print("no command for this filetype")
        return
    end

    require('harpoon.term').sendCommand(1, cmd .. line_ending)
    require('harpoon.term').gotoTerminal(1)
end

return M
