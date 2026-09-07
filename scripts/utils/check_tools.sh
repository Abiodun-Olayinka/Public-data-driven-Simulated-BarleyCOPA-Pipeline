#!/usr/bin/env bash
echo "Checking tools..."
for t in Rscript python3 bcftools plink2 bgzip bedtools; do
  if command -v "$t" >/dev/null 2>&1; then
    echo "  OK  $t"
  else
    echo "  MISSING  $t"
  fi
done
