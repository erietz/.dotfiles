if exists("current_compiler")
  finish
endif

let current_compiler = 'gcc'
CompilerSet makeprg=gcc\ %\ -o\ %:r
