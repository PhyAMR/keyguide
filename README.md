# keyguide

A searchable keybinding guide for desktop apps on [Omarchy](https://omarchy.org).
Press a key and get the shortcuts of the app you're in; start typing to filter.

- **Focused app first.** It asks Hyprland which window is active and opens that
  app's guide; otherwise it starts at the app picker.
- **Live where possible.** bookokrat (its `--print-default-keybindings` plus your
  `keybindings.toml`), Zen Browser (the profile's `zen-keyboard-shortcuts.json`)
  and yazi (entries with a `desc` in `keymap.toml`) are read live, so the guide
  matches your actual config.
- **Hand-written for the rest.** One TSV per app in `~/.config/keyguides/`:
  `keys<TAB>description[<TAB>section]`, `#` comments, and an optional first line
  `# title: Name`. Drop in a new file and it appears in the picker.

## Install

Needs Python 3, Hyprland and Omarchy (`omarchy-menu-select` shows the menu).

```bash
git clone https://github.com/PhyAMR/keyguide ~/code/keyguide
~/code/keyguide/install.sh
```

This links `keyguide` into `~/.local/bin` and copies the example guides in
`examples/` (imv, lazygit, mpv, yazi, zen) into `~/.config/keyguides` unless you
already have them. Bind it in `~/.config/hypr/bindings.lua`:

```lua
o.bind("SUPER + SHIFT + K", "App keybindings", "keyguide")
```

## Use

```text
keyguide                 the focused app's guide, else the app picker
keyguide <app>           one app's guide (yazi, bookokrat, zen, …)
keyguide --pick          always start at the app picker
keyguide --all           every app's bindings in one searchable list
keyguide --list          known apps
keyguide --print [app]   print to the terminal instead of the menu
```

## License

MIT, see [LICENSE](LICENSE).
