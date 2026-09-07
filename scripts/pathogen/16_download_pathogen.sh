#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
OUT="$ROOT/data/pathogen/ramularia"
mkdir -p "$OUT"
cd "$OUT"
curl -L --retry 15 --retry-delay 5 -C - -o Annot_RccAll.vcf "https://zenodo.org/records/3256422/files/Annot_RccAll.vcf?download=1"
bgzip Annot_RccAll.vcf
bcftools index Annot_RccAll.vcf.gz
echo "Download complete"