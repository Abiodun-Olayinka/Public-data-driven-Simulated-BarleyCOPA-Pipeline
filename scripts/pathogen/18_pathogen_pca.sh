#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
DIR="$ROOT/data/pathogen/ramularia"
RES="$ROOT/results/pathogen"
mkdir -p "$RES"
cd "$DIR"
plink2 --bfile Rcc_qc --freq --out "$RES/rcc_freq" --allow-extra-chr
plink2 --bfile Rcc_qc --read-freq "$RES/rcc_freq.afreq" --pca 5 --out "$RES/rcc_pca" --allow-extra-chr
echo "PCA complete"