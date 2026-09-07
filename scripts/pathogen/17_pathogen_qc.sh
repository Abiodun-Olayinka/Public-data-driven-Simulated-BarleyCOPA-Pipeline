#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
DIR="$ROOT/data/pathogen/ramularia"
OUT_PREFIX="$DIR/Rcc_qc"
cd "$DIR"
bcftools view -q 0.05 -Q 0.95 -m2 -M2 -v snps Annot_RccAll.vcf.gz | bgzip -c > Rcc_filtered.vcf.gz
bcftools index Rcc_filtered.vcf.gz
plink2 --vcf Rcc_filtered.vcf.gz --make-bed --out "$OUT_PREFIX" --allow-extra-chr
echo "QC complete"