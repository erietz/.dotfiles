" the built in way to make a python file in vim would be
"
" :compiler pyunit
" set makeprg=python3\ %
" :make
"
" however this only gives one line of context where the error occurs


if (!filereadable('Makefile') && !filereadable('makefile'))
    if exists("current_compiler")
      finish
    endif

    "---------------------------------------------------------------------------
    "let current_compiler = "pyunit"
    "let &l:makeprg="python3 %"
    "---------------------------------------------------------------------------

    let current_compiler = "python"
    
    let s:cpo_save = &cpo
    set cpo&vim
    
    CompilerSet errorformat=
          \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
          \%*\\sFile\ \"%f\"\\,\ line\ %l,
    CompilerSet makeprg=python3\ %
    
    let &cpo = s:cpo_save
    unlet s:cpo_save
  endif
" for more info try :help write-compiler-plugin
