#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
mkdir -p "$ROOT/data/raw/yuan" "$ROOT/data/pathogen/ramularia"
mkdir -p "$ROOT/results/pathogen" "$ROOT/results/breeding" "$ROOT/logs"
echo "Created: $ROOT"
