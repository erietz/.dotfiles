
My personal dotfiles managed with GNU [stow]. Previously I used a [Makefile].
All dependencies are installed using [Ansible] in [this repo][machine-setup].
Since you cannot use ansible on Windows as a host machine, I have opted to keep
all Windows "dotfiles" in [another repo][windows-config] and resort to ad hoc
scripts.

# Modifier Keys

Though I would prefer for the key directly to the left of the space bar, call
this key `X`, to be the mod key used for tiling window managers, I have settled
on the following set modifier keys.

| Mac (Before) | Linux (Before) | Mac (After) | Linux (After) |
| ---          | ---            | ---         | ---           |
| CAPS         | CAPS           | CTRL        | CTRL          |
| CTRL         | CTRL           | CTRL        | ALT           |
| OPT          | SUP            | OPT         | SUP           |
| CMD          | ALT            | CMD         | CTRL          |

This allows consistent use of key `X` for the following:

| Key combo | Action               |
| ---       | ---                  |
| `X + c`   | copy                 |
| `X + x`   | cut                  |
| `X + v`   | paste                |
| `X + w`   | close browser tab    |
| `X + q`   | close focused window |

given the constraints that

- On Linux: `mod` must be `mod4` (a.k.a. `super` ) since `alt` is used by other
  programs.
- On MacOS: `mod` must be `option` (a.k.a. `alt`) since `cmd` is used all over
  the OS.

# Essential Bindings On Any Window Manager

| Key combo         | Action                             |
| ---               | ---                                |
| `mod + 1`         | Go to workspace 1                  |
| `mod + 2`         | Go to workspace 2                  |
| `mod + 3`         | Go to workspace 3                  |
| `mod + 4`         | Go to workspace 4                  |
| `mod + 5`         | Go to workspace 5                  |
| `mod + 6`         | Go to workspace 6                  |
| `mod + 7`         | Go to workspace 7                  |
| `mod + 8`         | Go to workspace 8                  |
| `mod + 9`         | Go to workspace 9                  |
| `mod + Shift + 1` | Move focused window to workspace 1 |
| `mod + Shift + 2` | Move focused window to workspace 2 |
| `mod + Shift + 3` | Move focused window to workspace 3 |
| `mod + Shift + 4` | Move focused window to workspace 4 |
| `mod + Shift + 5` | Move focused window to workspace 5 |
| `mod + Shift + 6` | Move focused window to workspace 6 |
| `mod + Shift + 7` | Move focused window to workspace 7 |
| `mod + Shift + 8` | Move focused window to workspace 8 |
| `mod + Shift + 9` | Move focused window to workspace 9 |
| `mod + t`         | Set layout to tiling               |
| `mod + m`         | Set layout to monocle              |
| `mod + f`         | Set layout to floating             |
| `mod + Enter`     | Open terminal                      |
| `mod + u`         | Set gaps for ultrawide monitor     |
| `mod + Shift + u` | Unset gaps for ultrawide monitor   |
| `mod + p`         | dmenu                              |


[stow]: https://www.gnu.org/software/stow/
[Makefile]: https://github.com/erietz/.ewr/blob/842e3107cd83bb36224ba90d72192bb4b49a3503/Makefile
[Ansible]: https://www.ansible.com/
[machine-setup]: https://github.com/erietz/machine-setup
[windows-config]: https://github.com/erietz/windows-config
