"if !exists("current_compiler")
"  compiler pyunit
"endif
"
compiler ruby
set makeprg=ruby\ %
let b:dispatch = './%'
