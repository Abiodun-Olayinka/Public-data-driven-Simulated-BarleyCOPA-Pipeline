#!/usr/bin/env bash
echo "Checking required tools..."
MISSING=0
for t in Rscript python3 bcftools plink2 gcta bgzip bedtools tabix; do
  if command -v "$t" >/dev/null 2>&1; then
    echo "  OK: $t"
  else
    echo "  MISSING: $t"
    MISSING=$((MISSING+1))
  fi
done
if [ $MISSING -eq 0 ]; then
  echo "All tools found!"
else
  echo "$MISSING tool(s) missing"
fi