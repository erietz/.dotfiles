#$pdf_previewer = 'xpdf -remote %R %O %S';
$pdf_previewer = 'zathura';

$pdflatex = 'lualatex -synctex=1 -interaction=nonstopmode';

#$pdf_update_method = 0;
#$pdf_update_command = 'xpdf -remote %R -reload';

@generated_exts = (@generated_exts, 'synctex.gz');
