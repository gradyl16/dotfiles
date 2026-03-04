# Dylen's Dotfiles

## Disclaimer

These dotfiles have been specifically curated for systems of my configuration. I will do my best to provide dependency lists, but these are subject to change and may depend on the environment.

## Install

### Dependencies

#### Pacman

All of these dependencies are Arch Linux packages available to `pacman`. If you are using a different distro, please find the equivalents on your own. See `deps.txt` for full list of dependencies.

Note that if you are not using certain dependencies (e.g. `hyprland`), my configuration will *not* work for your system.

For convenience, `deps.txt` is listed here:

```
bash
hyprland
hyprlock
hypridle
hyprpanel
kitty
zellij
cargo
qt5ct
gtk4-git
fuzzel
zathura
btop
```

```bash
paru -S $(cat deps.txt) # Use any AUR helper for this
```

### Application

Make sure you do not have conflicting dotfiles. `stow` will throw errors if you have your own config that differs. Additionally, naive usage of certain `stow` flags may be destructive if used without care.

> [!IMPORTANT]
> Make sure you want to use all utilities in my dotfiles. If not, manage `dotfiles/*` and `deps.txt` accordingly.

```bash
sudo pacman -S stow  # For symlink creation and dotfile maintenance over time
cd ~
git clone git@github.com:gradyl16/dotfiles
cd dotfiles
stow .
```

#### Non-Packaged Dependencies

## References

### Themes

- [Dracula Theme](https://draculatheme.com)
- [Catpuccin Theme](https://catpuccin.com)

## Special Notes

### Kitty

`s` as an alias for `kitten ssh` will only work if you are not inside of a `zellij` session. For some reason, the keypass protocol buil into kitty doesn't work inside of `zellij`. If you are regularly connecting to remotes from inside of `zellij`, use the default `ssh` client.
