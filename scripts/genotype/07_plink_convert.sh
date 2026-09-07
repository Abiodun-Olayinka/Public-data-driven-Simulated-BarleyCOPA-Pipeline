#!/usr/bin/env bash
set -euo pipefail
VCF_IN="$1"
PREFIX="${2:-data/genotypes/plink}"
plink2 --vcf "$VCF_IN" --make-bed --out "$PREFIX" --allow-extra-chr
echo "PLINK files written to: ${PREFIX}.bed/.bim/.fam"