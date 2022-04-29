if vim.fn.has("win32") then
    local line_ending = "\r\n"
else
    local line_ending = "\n"
end

harpoon_filetype_map = {
    ["python"] = function()
        return "python " .. vim.fn.expand("%:p")
    end
}

function get_harpoon_cmd()
    local filetype = vim.bo.filetype
    return harpoon_filetype_map[filetype]() .. "\r\n"
end

function run_harpoon_cmd_and_navigate()
    require('harpoon.term').sendCommand(1, get_harpoon_cmd())
    require('harpoon.term').gotoTerminal(1)
end
