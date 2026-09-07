#!/usr/bin/env bash
set -euo pipefail
BED_FILE="$1"
GFF_FILE="${2:-data/reference/Morex_V3.gff}"
OUT_PREFIX="${3:-results/gwas/gene_overlap}"
bedtools intersect -a "$BED_FILE" -b "$GFF_FILE" -wa -wb > "${OUT_PREFIX}.tsv"
echo "Gene overlaps written"