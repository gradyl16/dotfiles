# Dylen's Dotfiles

These are my dots. I run all of my workstations on an Arch Linux installation with Hyprland window management. You can pick and choose from my dots, but differing in these base layers will drastically reduce adaptability.

## Disclaimer

These dotfiles have been specifically curated for systems of my configuration. Any dependencies or other "required" software are only all necessary if you want to essentially duplicate my working environment.

## Install

### Initial Setup

If you plan to use these dotfiles on a new install, be sure to follow the [Arch Install Guide](https://wiki.archlinux.org/title/Installation_guide) before moving on. I have a personalized version for my LVM on LUKS setup in `BASE_INSTALL.md`.

#### Dependency Installation

Now that you have a working system, set up an AUR helper (I use [`paru`](https://github.com/Morganamilo/paru)) so we can install all of our package dependencies. `./install_packages.sh` will take a while to finish executing if you did not modify the package list (`pkgs.txt`).

```bash
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd
git clone https://github.com/gradyl16/dotfiles
cd dotfiles/utils
./install_pkgs.sh
```

#### Third Party Dependencies

I use a variety of software that isn't packaged by Arch or the community (or that I prefer from another provider). Here you can find the installation documentation for each piece of software.

- `colorls` => `gem install colorls`
- [Oh My Posh](https://ohmyposh.dev/docs/installation/linux) (Shell decorator) => `curl -s https://ohmyposh.dev/install.sh | bash -s`

> [!IMPORTANT]
> My Zellij config will *not* work unless the autolock path is changed to match your user. Currently, it's hardcoded to my desktop user.
- [Zellij](https://zellij.dev/documentation/installation.html) (Terminal Multiplexer) => `cargo install zellij --locked`

- [Bun](https://bun.com/docs/installation) (Bundler) => `curl -fsSL https://bun.com/install | bash`

---

### Quality of Life Improvements

#### Keyboard Remapping

For sanity, I start with my keyboard modifiers before moving on. The packages `interception-tools` and `interception-vimproved-git` should have been installed from the previous command. If they are not already, make sure they are before proceeding.

First, Modify the `PKGBUILD` as instructed in [the spec](https://aur.archlinux.org/packages/interception-vimproved-git) (can be found at `~/.cache/paru/clone/interception-vimproved-git/PKGBUILD`). Next, create a `udevmon` spec at `/etc/interception/udevmon.d/udevmon.yaml` similar to what's below:

```yaml
- JOB: "intercept -g $DEVNODE | interception-vimproved | uinput -d $DEVNODE"
  DEVICE:
    NAME: ".*((k|K)(eyboard|EYBOARD)).*"
```

Enable and start the service. Test to make sure it works.

```bash
sudo systemctl enable udevmon --now
systemctl status udevmon
```

### Activating Dots

Make sure you do not have conflicting dotfiles. `stow` will throw errors if you have your own config that differs. Additionally, naive usage of certain `stow` flags may be destructive if used without care.

> [!IMPORTANT]
> Make sure you want to use all utilities in my dotfiles. If not, manage `dotfiles/*` and `pkgs.txt` accordingly.

```bash
sudo pacman -S stow  # For symlink creation and dotfile maintenance over time
cd ~
git clone git@github.com:gradyl16/dotfiles
cd dotfiles
stow .
start-hyprland       # Temporary until autostart is configured (refer to Arch Wiki: agetty)
```

Make sure to edit `/etc/pacman.conf` with the options "Color" and "ILoveCandy"

## Special Notes

### Neovim

This config has an entire repository to itself. If you don't recursively clone subprojects, you won't have my neovim config.

### Kitty

`s` as an alias for `kitten ssh` will only work if you are not inside of a `zellij` session. For some reason, the keypass protocol buil into kitty doesn't work inside of `zellij`. If you are regularly connecting to remotes from inside of `zellij`, use the default `ssh` client.

## References

### Themes

- [Dracula Theme](https://draculatheme.com)
- [Catpuccin Theme](https://catpuccin.com)

## Misc

- Add note about enabling color and insults in `pacman.conf`
