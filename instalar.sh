#!/usr/bin/env bash
# Instala a CLI do Craft Anything compilando do código-fonte.
set -euo pipefail
command -v cargo >/dev/null || { echo "Instale o Rust primeiro: https://rustup.rs"; exit 1; }
dir="${TMPDIR:-/tmp}/craft-anything"
[ -d "$dir" ] || git clone --depth 1 https://github.com/storytold/craft-anything "$dir"
cargo install --locked --path "$dir/apps/craft-anything-cli"
craft-anything-cli setup --client claude_code --yes
craft-anything-cli doctor
