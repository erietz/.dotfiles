local M = {}

-- Global variables to this file------------------------------------------------
local line_ending = nil
if vim.fn.has("win32") == 1 then
    line_ending = "\r\n"
else
    line_ending = "\n"
end

-- Local Functions--------------------------------------------------------------

-- this is weird way to do this but whatever.
local function filename(mod)
    if mod == "absolute" then
        return vim.fn.expand("%:p")
    elseif mod == "dirname"  then
        return vim.fn.expand("%:h")
    elseif mod == "basename"  then
        return vim.fn.expand("%:t")
    elseif mod == "root"  then
        return vim.fn.expand("%:f")
    elseif mod == "root_absolute"  then
        return vim.fn.expand("%:p:r")
    else
        error("invalid file modifier")
    end
end


local harpoon_filetype_map = {
    ["python"] = function()
        return "python " .. filename("absolute")
    end,
    ["javascript"] = function()
        return "node " .. filename("absolute")
    end,
    ["typescript"] = function()
        return "ts-node " .. filename("absolute")
    end,
    ["lua"] = function()
        return "lua " .. filename("absolute")
    end,
    ["c"] = function()
        return "gcc "..filename("absolute").." -o "..filename("root_absolute")..
            " && "..filename("root_absolute")
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
