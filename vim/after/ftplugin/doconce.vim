nnoremap <leader>c :w<CR>:!doconce format pdflatex % && latexmk -pdf %:r:r.p.tex<CR>
