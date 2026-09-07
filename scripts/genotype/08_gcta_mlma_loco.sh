#!/usr/bin/env bash
set -euo pipefail
PLINK_PREFIX="$1"
PHENO_FILE="$2"
OUT_PREFIX="${3:-results/gwas/gcta}"
gcta --bfile "$PLINK_PREFIX" --make-grm --out "$OUT_PREFIX" --threads 4
gcta --grm "$OUT_PREFIX" --pheno "$PHENO_FILE" --mlma --out "${OUT_PREFIX}_mlma" --threads 4
gcta --grm "$OUT_PREFIX" --pheno "$PHENO_FILE" --mlma-loco --out "${OUT_PREFIX}_loco" --threads 4
echo "GWAS results written"