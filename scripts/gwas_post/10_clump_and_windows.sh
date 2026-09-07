#!/usr/bin/env bash
set -euo pipefail
GWAS_RESULT="$1"
PLINK_PREFIX="$2"
OUT_PREFIX="${3:-results/gwas/clumped}"
plink2 --bfile "$PLINK_PREFIX" --clump "$GWAS_RESULT" --clump-p1 1e-5 --clump-r2 0.2 --clump-kb 250 --out "$OUT_PREFIX"