#!/usr/bin/env bash
set -euo pipefail
VCF_IN="$1"
VCF_OUT="${2:-data/genotypes/filtered.vcf.gz}"
bcftools view -q 0.05 -Q 0.95 -m2 -M2 -v snps "$VCF_IN" | bgzip -c > "$VCF_OUT"
bcftools index "$VCF_OUT"
echo "Filtered VCF written to: $VCF_OUT"