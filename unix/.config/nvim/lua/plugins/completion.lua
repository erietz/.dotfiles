return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		config = function()
			local luasnip = require("luasnip")
			local s = luasnip.snippet
			local t = luasnip.text_node
			local i = luasnip.insert_node
			local f = luasnip.function_node
			local c = luasnip.choice_node
			-- local sn = luasnip.snippet_node
			-- local d = luasnip.dynamic_node
			-- local r = luasnip.restore_node
			local fmt = require("luasnip.extras.fmt").fmt
			local rep = require("luasnip.extras").rep
			local types = require("luasnip.util.types")
			local parse_snippet = luasnip.parser.parse_snippet

			require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.config.set_config({
				history = true, -- jump back if you make a mistake
				updateevents = "TextChanged,TextChangedI", -- for dynamic snippets
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { " <- Current Choice", "NonTest" } },
						},
					},
				},
			})

			vim.keymap.set({ "i", "s" }, "<c-k>", function()
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					vim.cmd("wincmd k")
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<c-j>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					vim.cmd("wincmd j")
				end
			end, { silent = true })

			vim.keymap.set("i", "<c-l>", function()
				if luasnip.choice_active() then
					luasnip.change_choice(1)
				else
					vim.cmd("wincmd l")
				end
			end)

			vim.keymap.set("i", "<c-h>", require("luasnip.extras.select_choice"))
			vim.keymap.set("n", "<leader>ss", "<cmd>source ~/.config/nvim/lua/ewr/plugin_config/luasnip.lua<CR>")

			-- all {{{

			luasnip.add_snippets("all", {

				s("today", {
					f(function()
						return os.date("%Y-%m-%d")
					end),
				}),

				s(
					"about",
					fmt(
						[[
Author:         Ethan Rietz
Date:           {}
Description:    {}
{}
]],
						{ i(1, os.date("%Y-%m-%d")), i(2, ""), i(3, "") }
					)
				),
			})

			-- }}}
			-- c {{{
			luasnip.add_snippets("c", {
				parse_snippet(
					"skeleton",
					[[
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
]]
				),
				s(
					"docstring",
					fmt(
						[[
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
							i(1, ""),
							rep(1),
							i(2, "..."),
							i(3, "Any arguments are ignored."),
							i(4, "Value does not change"),
						}
					)
				),
			})

			-- }}}
			-- c header -> c++ {{{

			luasnip.add_snippets("cpp", {
				s(
					"header-gaurd",
					fmt(
						[[
#ifndef {gaurd}
#define {gaurd}

{contents}

#endif // {gaurd}
]],
						{
							gaurd = f(function()
								return string.upper(vim.fn.expand("%:t:r")) .. "_H"
							end),
							contents = i(1, ""),
						}
					)
				),
			})

			-- }}}
			-- cs {{{
			luasnip.add_snippets("cs", {
				s(
					"main",
					fmt(
						[[
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
					)
				),
			})

			-- }}}
			-- dart/flutter {{{
			luasnip.add_snippets("dart", {
				s(
					"stateless-widget",
					fmt(
						[[
class <class_name> extends StatelessWidget {
  const <constructor_name><constructor_parameters>;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("text here")
      )
    );
  }
}
]],
						{
							class_name = i(1, "MyWidget"),
							constructor_name = rep(1),
							constructor_parameters = c(2, {
								t([[({Key? key}) : super(key: key)]]),
								i(2, [[()]]),
							}),
						},
						{ delimiters = "<>" }
					)
				),
				s(
					"stateful-widget",
					fmt(
						[[
class [] extends StatefulWidget {
  const []({Key? key}) : super(key: key);

  @override
  State<[]> createState() => _[]State();
}

class _[]State extends State<[]> {

  @override
  Widget build(BuildContext context) {
    return const Text("Stuff");
  }
}
]],
						{
							i(1, "MyWidget"),
							rep(1),
							rep(1),
							rep(1),
							rep(1),
							rep(1),
						},
						{ delimiters = "[]" }
					)
				),
			})
			-- }}}
			-- gitcommit {{{

			luasnip.add_snippets("gitcommit", {
				s("idk", t("unhelpful commit message")),
			})

			-- }}}
			-- go {{{

			luasnip.add_snippets("go", {
				s(
					"err",
					t({
						"if err != nil {",
						"	panic(err)",
						"}",
					})
				),
				s(
					"got",
					fmt([[t.Errorf("got %v, wanted %v", {}, {})]], {
						i(1, "got"),
						i(2, "wanted"),
					})
				),
			})

			-- }}}
			-- make {{{

			luasnip.add_snippets("make", {
				s(
					"python",
					t({
						"test",
						"	pytest -rA -v",
						"",
						"clean",
						"	rm -r __pycache__",
						"	rm -r ./.pytest_cache",
					})
				),
				parse_snippet(
					"help",
					[[
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
]]
				),
			})

			-- }}}
			-- markdown {{{

			luasnip.add_snippets("markdown", {
				parse_snippet("link", "[${1:Description}](${2:www.url.com})$0"),
				parse_snippet("img", '![${1:pic alt}](${2:path}${3/.+/ "/}${3:opt title}${3/.+/"/})$0'),
				parse_snippet(
					"cb",
					[[
```${1:python}
$2
```
$0
]]
				),
				parse_snippet("todo", "- [ ] ${1:item that needs done}"),
				parse_snippet(
					"fnt",
					[[
[^${1:Footnote}]$0

[^$1]: ${2:Text}
]]
				),
				parse_snippet(
					"preamble",
					[[
---
title: $1
author: ${2:Ethan Rietz}
date: ${3:\today}
---

$0
]]
				),
			})

			-- }}}
			-- pandoc {{{

			luasnip.filetype_extend("pandoc", { "markdown" })

			-- }}}
			-- nasm {{{

			luasnip.add_snippets("nasm", {
				s(
					"docstring",
					fmt(
						[[
; -----------------------------------------------------------------------------
; Name: {}
;
; {}
;
; Preconditions: {}
;
; Postconditions: {}
;
; Receives: {}
;
; Returns: {}
; -----------------------------------------------------------------------------
]],
						{
							i(1),
							i(2, "Overall decription of procedure"),
							i(3),
							i(4),
							i(5),
							i(6),
						}
					)
				),
			})
			-- }}}
			-- python {{{

			luasnip.add_snippets("python", {
				s(
					"main",
					fmt(
						[[
if __name__ == "__main__":
    {}
]],
						{ i(1, "main()") }
					)
				),
			})

			-- }}}
			-- sh {{{
			luasnip.add_snippets("sh", {
				s("shebang", t({ "#!/usr/bin/env bash", "", "" })),
			})

			-- }}}
			-- tex {{{

			luasnip.add_snippets("tex", {
				parse_snippet(
					"preamble",
					[[
\documentclass{article}
\usepackage{geometry}
\usepackage{amsmath,amsfonts,amssymb}
\usepackage{longtable,booktabs}
\usepackage{listings}
\usepackage{graphicx}
\graphicspath{{images/}{plots/}{figures/}}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue
}
%\usepackage[style=chem-acs, autocite=superscript]{biblatex}
%\addbibresource{ref.bib}
%\usepackage{physics}
%\setcounter{secnumdepth}{0}
%\setlength\parindent{0pt}
%\usepackage[usenames,dvipsnames]{xcolor}
%\usepackage{siunitx}
%\usepackage{mhchem}

\title{${1:Title}}
\author{Ethan Rietz}
\date{\today}

\begin{document}
\maketitle

$0

\end{document}
]]
				),
				parse_snippet("up", [[ \usepackage{${1:package}}$0]]),
			})

			--[[
extends texmath

snippet preamble "Preamble" b
\documentclass{article}
\usepackage{geometry}
\usepackage{amsmath,amsfonts,amssymb}
\usepackage{longtable,booktabs}
\usepackage{listings}
\usepackage{graphicx}
\graphicspath{{images/}{plots/}{figures/}}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue
}
%\usepackage[style=chem-acs, autocite=superscript]{biblatex}
%\addbibresource{ref.bib}
%\usepackage{physics}
%\setcounter{secnumdepth}{0}
%\setlength\parindent{0pt}
%\usepackage[usenames,dvipsnames]{xcolor}
%\usepackage{siunitx}
%\usepackage{mhchem}

\title{${1:Title}}
\author{Ethan Rietz}
\date{\today}

\begin{document}
\maketitle

$0

\end{document}
endsnippet

snippet up "Use Package"
\usepackage{${1:package}}$0
endsnippet

snippet "beg(in)?" "begin{} / end{}" br
\begin{${1:<environment>}}
    ${0:${VISUAL}}
\end{$1}
endsnippet

snippet nc "New Command"
    \\newcommand{\\${1:cmd}}[${2:opt}]{${3:realcmd}} ${0}
endsnippet

snippet "fig" "Figure environment" br
\begin{figure}[${2:htpb}]
    \centering
    \includegraphics[width=${3:0.8}\linewidth]{${4:name.ext}}
    \caption{$0}
    \label{fig:$5}
\end{figure}
endsnippet

snippet "tab(le)?" "Table environment" br
\begin{table}[${1:htpb}]
    \centering
    \caption{${2:caption}}
    \label{tab:${3:label}}
    \begin{tabular}{${4:c}}
    $0
    \end{tabular}
\end{table}
endsnippet

snippet "tabu(lar)?" "Tabular environment" br
\begin{tabular}{${1:c}}
$0
\end{tabular}
endsnippet

snippet "sec(tion)?" "Section" br
\section{${1:${VISUAL:section name}}}

$0
endsnippet

snippet "sub(section)?" "Subsection" br
\subsection{${1:${VISUAL:Subsection name}}}

$0
endsnippet

snippet "subsub(section)?" "Subsubsection" br
\subsubsection{${1:${VISUAL:Subsubsection name}}}

$0
endsnippet

snippet "lab(el)?" "Section" r
\label{${1:${VISUAL:label name}}} $0
endsnippet

snippet "i(tem)?" "Item" br
\item{${1:${VISUAL:The item}}}
$0
endsnippet

snippet "d(tem)?" "Description item" br
\item[${1:Description word}]{${2:${VISUAL:The item}}}
$0
endsnippet

snippet it "Italics"
\textit{${1:${VISUAL:italics}}} $0
endsnippet

snippet bf "Boldfont"
\textbf{${1:${VISUAL:italics}}} $0
endsnippet

# Packages #################################################

# SI Units----------------------------------------------------------------------

snippet si "SI Units"
\SI{${1:Number}}{${2:Units}} ${0}
endsnippet

# Exam Class-------------------------------

snippet "que(stion)?" "Question" br
\question[${1:Points}] ${2:The questions}

\begin{solution}
${0}
\end{solution}
\vspace{\stretch{1}}
endsnippet

snippet "c(hoices)?" "Choices" br
\choice{${1:${VISUAL:The choice}}}
endsnippet

# mhchem
snippet ce "Chemical equation"
\ce{$1} $0
endsnippet
--]]

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
				parse_snippet(
					"newline",
					[[ \[$1\] $0
    ]]
				),
			}

			luasnip.add_snippets("tex", texmath_snippets)
			luasnip.add_snippets("pandoc", texmath_snippets)

			-- }}}
		end,
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			return {
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "path" },
					{
						name = "buffer",
						-- keyword_length = 3,
						-- option = {
						-- 	keyword_pattern = [[\k\+]],
						-- }
					},
					{ name = "orgmode" },
				},

				-- -- Custom entry filtering
				-- formatting = {
				-- 	format = function(entry, vim_item)
				-- 		if vim_item.abbr:match("%s") then
				-- 			vim_item.abbr = ""
				-- 		end
				-- 		return vim_item
				-- 	end,
				-- },

				-- Additional filtering at the source level
				sorting = {
					comparators = {
						function(entry1, entry2)
							local contains_space = function(e)
								return e.completion_item.label:match("%s")
							end
							if contains_space(entry1) then
								return false
							elseif contains_space(entry2) then
								return true
							end
							return nil
						end,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},

				mapping = cmp.mapping.preset.insert({
					-- ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
					-- ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-g>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
				}),

				-- Add vim-dadbod-completion in sql files
				_ = vim.cmd([[
					augroup DadbodSql
					au!
					autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
					augroup END
					]]),
			}
		end,
	},
}
