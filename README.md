# dotfiles

## Initial setup
```
git clone https://github.com/mshr-h/dotfiles.git ~/.dotfiles
bash ~/.dotfiles/bootstrap.sh
bash ~/.dotfiles/install.sh
```


## Herdr Desktop

`herdr-app/` tracks personal preferences, keyboard bindings (including Ctrl+M),
and the Catppuccin Mocha palette. Session data, machine connections, generated
layouts/mods, telemetry, and update files stay outside this repository.

Set up only Herdr's config with:

```sh
bash ~/.dotfiles/herdr-app/bootstrap.sh
```

The main `bootstrap.sh` also runs this setup. It links each tracked file into
`~/.config/herdr-app`, respecting `XDG_CONFIG_HOME` and `HERDR_APP_HOME`.
Identical existing files become symlinks; differing files and other symlinks
are preserved with a message. Move a conflicting file aside and rerun to use
the repository's version.

Changes saved in Herdr update the linked files; review `git diff` before
committing. After editing files directly in this repository, restart Herdr if
it does not pick up the change. Do not link the entire app config directory:
Herdr also writes generated files and session state there.
