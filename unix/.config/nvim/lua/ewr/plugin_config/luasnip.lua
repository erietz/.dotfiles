local luasnip = require("luasnip")
local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
    history = true,     -- jump back if you make a mistake
    updateevents = "TextChanged,TextChangedI",  -- for dynamic snippets
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

vim.keymap.set("n", "<leader>ss", "<cmd>source ~/.config/nvim/lua/ewr/plugin_config/luasnip.lua<CR>")

-- all {{{

luasnip.add_snippets("all", {

    s("today", {
        f(function() return os.date("%Y-%m-%d") end),
    }),

    s("about", fmt([[
Author:         Ethan Rietz
Date:           {}
Description:    {}
{}
]],
        { i(1, os.date("%Y-%m-%d")), i(2, ""), i(3, "") }
    ))

})

-- }}}

-- c {{{
luasnip.add_snippets("c", {
    luasnip.parser.parse_snippet("skeleton", [[
/* headers */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

/* macros */
/* types */
/* function declarations */
/* global variables */
/* function definitions */

int
main(int argc, char *argv[])
{
	return EXIT_SUCCESS;
}
]]),
    s("docstring", fmt([[
/*
*------------------------------------------------------------------------------
* Function: {}()
*
* Description:
* {}() is used for {}
* 
* Function Arguments:
*     {}
*
* Return Value:
*     {}
*------------------------------------------------------------------------------
*/
]],
        {
            i(1, ""), rep(1), i(2, "..."),
            i(3, "Any arguments are ignored."),
            i(4, "Value does not change")
        })),
})

-- }}}
