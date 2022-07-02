local keymap = require("ewr.keymap")


local line_ending = nil
if vim.fn.has("win32") == 1 then
    line_ending = "\r\n"
else
    line_ending = "\n"
end


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
    ["dart"] = function()
        return "dart " .. filename("absolute")
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

local function run_harpoon_cmd_and_navigate()
    local cmd = get_harpoon_cmd()
    if cmd == nil then
        print("no command for this filetype")
        return
    end
    require('harpoon.term').sendCommand(1, cmd .. line_ending)
    require('harpoon.term').gotoTerminal(1)
end


keymap.nnoremap('<leader>a', function()
    require('harpoon.mark').add_file()
end,
    {desc = "Harpoon: Adds mark for the current file"}
)

keymap.nnoremap('<leader>h', function()
    require('harpoon.ui').toggle_quick_menu()
end,
    { silent = true, desc = "Harpoon: Toggle quick menu" }
)

keymap.nnoremap('<leader>1', function()
    require('harpoon.ui').nav_file(1)
end,
    { silent = true, desc = "Harpoon: navigate to file 1" }
)

keymap.nnoremap('<leader>2', function()
    require('harpoon.ui').nav_file(2)
end,
    { silent = true, desc = "Harpoon: navigate to file 2" })

keymap.nnoremap('<leader>3', function()
    require('harpoon.ui').nav_file(3)
end,
    { silent = true, desc = "Harpoon: navigate to file 3" })

keymap.nnoremap('<leader>4', function()
    require('harpoon.ui').nav_file(4)
end,
    { silent = true, desc = "Harpoon: navigate to file 4" })

keymap.nnoremap('<leader>5', function()
    require('harpoon.ui').nav_file(5)
end,
    { silent = true, desc = "Harpoon: navigate to file 5" })

keymap.nnoremap('<localleader>1', function()
    require('harpoon.term').gotoTerminal(1)
end,
    { silent = true, desc = "Harpoon: navigate to terminal 1" })

keymap.nnoremap('<localleader>2', function()
    require('harpoon.term').gotoTerminal(2)
end,
    { silent = true, desc = "Harpoon: navigate to terminal 2" })

keymap.nnoremap('<localleader>r', function()
    run_harpoon_cmd_and_navigate()
end,
    { desc = "Harpoon: Run the current file in the first harpoon terminal" }
)

