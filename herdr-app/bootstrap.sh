#!/bin/bash
set -eu

source_dir="$(cd "$(dirname "$0")" && pwd)"
config_dir="${HERDR_APP_HOME:-${XDG_CONFIG_HOME:-$HOME/.config}/herdr-app}"

for name in settings.json keys.json themes/catppuccin-mocha.json; do
  source_file="$source_dir/$name"
  target="$config_dir/$name"
  mkdir -p "$(dirname "$target")"

  if [[ -L "$target" ]]; then
    if [[ "$(readlink "$target")" != "$source_file" ]]; then
      printf 'Herdr: keeping existing symlink %s\n' "$target" >&2
    fi
    continue
  fi

  if [[ -e "$target" ]]; then
    if [[ ! -f "$target" ]] || ! cmp -s "$source_file" "$target"; then
      printf 'Herdr: keeping differing settings at %s; move them aside and rerun to use dotfiles.\n' "$target" >&2
      continue
    fi
  fi

  ln -sfn "$source_file" "$target"
done
