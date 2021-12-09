[1mdiff --git a/.gitignore b/.gitignore[m
[1mindex 4e8a898..b085824 100644[m
[1m--- a/.gitignore[m
[1m+++ b/.gitignore[m
[36m@@ -25,3 +25,4 @@[m [mconfig/emacs/elpa[m
 config/emacs/auto-save-list[m
 config/emacs/transient[m
 *~[m
[32m+[m[32m**/*.pyc[m
[1mdiff --git a/config/gtk-3.0/settings.ini b/config/gtk-3.0/settings.ini[m
[1mindex 9e93d04..959b491 100644[m
[1m--- a/config/gtk-3.0/settings.ini[m
[1m+++ b/config/gtk-3.0/settings.ini[m
[36m@@ -1,7 +1,7 @@[m
 [Settings][m
 gtk-icon-theme-name=Arc[m
 gtk-theme-name=Adapta-Nokto-Maia[m
[31m-gtk-cursor-theme-name=xcursor-breeze[m
[32m+[m[32mgtk-cursor-theme-name=xcursor-breeze Xcursor.theme_core Xcursor.theme_core:[m
 gtk-cursor-theme-size=0[m
 gtk-font-name=Ubuntu 10[m
 gtk-xft-antialias=1[m
[1mdiff --git a/config/i3/config b/config/i3/config[m
[1mindex 2284e5f..6e645b9 100644[m
[1m--- a/config/i3/config[m
[1m+++ b/config/i3/config[m
[36m@@ -379,7 +379,7 @@[m [mgaps outer -2[m
 # gaps outer all plus 5[m
 [m
 # Smart gaps (gaps used if only more than one container on the workspace)[m
[31m-#smart_gaps on[m
[32m+[m[32msmart_gaps on[m
 [m
 # Smart borders (draw borders around container only if it is not the only[m
 # container on this workspace) on|no_gaps (on=always activate and no_gaps=only[m
[1mdiff --git a/config/zsh/unix.zsh b/config/zsh/unix.zsh[m
[1mindex 145661e..46be9c5 100644[m
[1m--- a/config/zsh/unix.zsh[m
[1m+++ b/config/zsh/unix.zsh[m
[36m@@ -82,7 +82,7 @@[m [malias f="find . -type f -iname"[m
 alias g="git"[m
 alias grep="grep --color=auto"[m
 alias jlremote="jupyter lab --no-browser --port=9876"[m
[31m-alias l="lsd -l"[m
[32m+[m[32malias l="exa -l"[m
 alias rcp="rsync --progress --verbose --recursive"[m
 alias sl="ls"[m
 alias ta="tmux attach"[m
