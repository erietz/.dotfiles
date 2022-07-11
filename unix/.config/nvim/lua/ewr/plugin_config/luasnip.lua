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
local parse_snippet = luasnip.parser.parse_snippet

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
    parse_snippet("skeleton", [[
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
-- cs {{{
luasnip.add_snippets("cs", {
    s("main", fmt([[
namespace {}
{{
	class {}
    {{
		static void Main(string[] args)
        {{
			System.Console.WriteLine("Hello World!");
		}}
	}}
}}
]],
        { i(1), i(2, "Program") }
    ))
})

-- }}}
-- gitcommit {{{

luasnip.add_snippets("gitcommit", {
    s("idk", t("unhelpful commit message"))
})

-- }}}
-- make {{{

luasnip.add_snippets("make", {
    s("python", t({
        "test",
        "\tpytest -rA -v",
        "",
        "clean",
        "\trm -r __pycache__",
        "\trm -r ./.pytest_cache",
    })),
    parse_snippet("help", [[
.DEFAULT_GOAL := help
.PHONY: help
help: ## Print this help message
	@echo "----------------------------------------------------------------------"
	@echo "Usage of this makefile"
	@echo "----------------------------------------------------------------------"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sort | sed -e 's/\$$//' | sed -e 's/:.*##/:,/' | column -t -s ,
	@echo
	@echo "For a dry run use this command: make -n <target>"
	@echo "----------------------------------------------------------------------"
]]),
})

-- }}}
-- markdown {{{

luasnip.add_snippets("markdown", {
    parse_snippet(
        "link", "[${1:Description}](${2:www.url.com})$0"
    ),
    parse_snippet(
        "img", '![${1:pic alt}](${2:path}${3/.+/ "/}${3:opt title}${3/.+/"/})$0'
    ),
    parse_snippet(
        "cb", [[
```${1:python}
$2
```
$0
]]
    ),
    parse_snippet(
        "todo", "- [ ] ${1:item that needs done}"
    ),
    parse_snippet(
        "fnt", [[
[^${1:Footnote}]$0

[^$1]: ${2:Text}
]]
    ),
    parse_snippet("preamble", [[
---
title: $1
author: ${2:Ethan Rietz}
date: ${3:\today}
---

$0
]])
})

-- }}}
-- pandoc {{{

luasnip.filetype_extend("pandoc", {"markdown"})

-- }}}
-- sh {{{
luasnip.add_snippets("sh", {
    s("shebang", t({"#!/usr/bin/env bash", "", ""}))
})

-- }}}
-- texmath {{{

local texmath_snippets = {
    parse_snippet("frac", [[ \frac{${1:numerator}}{${2:denominator}}${0} ]]),
    parse_snippet("E", [[ \times 10^{$1}$0 ]]),
    parse_snippet("sum", [[ \sum\limits_{${1:n}}^{${2:\infty}}$0 ]]),
    parse_snippet("*", [[ \times $0 ]]),
    parse_snippet("()", [[ \left( $1 \right) $0 ]]),
    parse_snippet("[]", [[ \left[ $1 \right] $0 ]]),
    parse_snippet("{}", [[ \left{ $1 \right} $0 ]]),
    parse_snippet("<>", [[ \left< $1 \right> $0 ]]),
    parse_snippet("|>", [[ \left| $1 \right> $0 ]]),
    parse_snippet("<|", [[ \left< $1 \right| $0 ]]),
    parse_snippet("inline", [[ \($1\)$0 ]]),
    parse_snippet("newline", [[ \[$1\] $0
    ]])
}

luasnip.add_snippets("tex", texmath_snippets)
luasnip.add_snippets("pandoc", texmath_snippets)

-- }}}
