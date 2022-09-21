local keymap = require("ewr.keymap")

local line_ending = nil
if vim.fn.has("win32") == 1 then
    line_ending = "\r\n"
else
    line_ending = "\n"
end

local path = {
    absolute = function()
        return vim.fn.expand("%:p")
    end,
    dirname = function()
        return vim.fn.expand("%:h")
    end,
    basename = function()
        return vim.fn.expand("%:t")
    end,
    root = function()
        return vim.fn.expand("%:r")
    end,
    root_absolute = function()
        return vim.fn.expand("%:p:r")
    end
}

local harpoon_filetype_map = {
    ["python"] = function()
        return "python " .. path:absolute()
    end,
    ["javascript"] = function()
        return "node " .. path:absolute()
    end,
    ["typescript"] = function()
        return "ts-node " .. path:absolute()
    end,
    ["lua"] = function()
        return "lua " .. path:absolute()
    end,
    ["dart"] = function()
        return "dart " .. path:absolute()
    end,
    ["c"] = function()
        return "gcc " .. path:absolute() .. " -o " .. path:root_absolute() ..
            " && " .. path:root_absolute()
    end,
    ["rust"] = function()
        return "cargo run"
    end
}

local function run_harpoon_cmd_and_navigate()
    local filetype = vim.bo.filetype
    local cmd = harpoon_filetype_map[filetype]
    if cmd == nil then
        print("no command for this filetype")
        return
    end
    require('harpoon.term').sendCommand(1, cmd() .. line_ending)
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

