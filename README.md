[//]: # ($FrauBSD: bhotkeys-screenshot/README.md 2026-10-04 11:46:01 -0700 Devin Teske $)

# bhotkeys-screenshot

`Print` and `Alt+Print` save a screenshot and show its file name.

Three [bhotkeys](https://github.com/FrauBSD/bhotkeys) plugins, and
the commands they run: the whole desktop, the focused window, and
the login greeter. `greeter-screenshot` is a symlink to
`desktop-screenshot`, built by `make`. Each command shows the
saved file name through [bosd](https://github.com/FrauBSD/bosd).

These are `listen 1` plugins: bhotkeys runs them. Under GNOME, KDE,
MATE, and Xfce, which already bind `Print`, the chords move to
`Ctrl+Print` and `Ctrl+Alt+Print` so the desktop's own screenshot
tool keeps its key, and both are in the same list for the user to
reconcile.

Home: [FrauBSD/bhotkeys-screenshot](https://github.com/FrauBSD/bhotkeys-screenshot)

## Requirements

- `bhotkeys`
- `bosd` for the file-name caption

## Build / install

```sh
make install    # PREFIX=/usr/local by default
```

Installs `desktop-screenshot`, `window-screenshot`, and
`greeter-screenshot` into `${PREFIX}/bin`, and the three plugins
into `${PREFIX}/share/bhotkeys/plugins.d`.

## Plugins

| id | chord | elsewhere | runs |
|---|---|---|---|
| shot-desktop | Print | Ctrl+Print on kde xfce gnome mate | `desktop-screenshot --feedback` |
| shot-window | Alt+Print | Ctrl+Alt+Print on xfce gnome mate | `window-screenshot --feedback` |
| shot-greeter | Print | greeter only (`session 0`, `greeter 1`) | `greeter-screenshot --feedback` |
