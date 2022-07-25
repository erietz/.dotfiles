
My personal dotfiles managed with GNU [stow]. Previously I used a [Makefile].
All dependencies are installed using [Ansible] in [this repo][machine-setup].
Since you cannot use ansible on Windows as a host machine, I have opted to keep
all Windows "dotfiles" in [another repo][windows-config] and resort to ad hoc
scripts.

[stow]: https://www.gnu.org/software/stow/
[Makefile]: https://github.com/erietz/.ewr/blob/842e3107cd83bb36224ba90d72192bb4b49a3503/Makefile
[Ansible]: https://www.ansible.com/
[machine-setup]: https://github.com/erietz/machine-setup
[windows-config]: https://github.com/erietz/windows-config
