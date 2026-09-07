#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
STAMP=$(date +%Y%m%d)
OUTDIR="${1:-$HOME/Documents/BarleyCOPA_ZenodoPackage_$STAMP}"
mkdir -p "$OUTDIR"/{tables,figures,docs,examples}
cp -R "$REPO/results/examples/"* "$OUTDIR/examples/" 2>/dev/null || true
cp "$REPO/docs/"*.md "$OUTDIR/docs/" 2>/dev/null || true
for f in \
  "$ROOT/results/breeding/ramularia_candidate_loci_elite.tsv" \
  "$ROOT/results/gwas/ramularia_mlma_loco_concordant.tsv" \
  "$ROOT/data/climate/processed/climate_indices_by_site_year.tsv" \
  "$ROOT/results/pathogen/rcc_pca.pdf"
do
  if [[ -f "$f" ]]; then cp "$f" "$OUTDIR/tables/" 2>/dev/null || true; fi
done
find "$OUTDIR" -type f | sort > "$OUTDIR/MANIFEST.txt"
TAR="$HOME/Documents/BarleyCOPA_public_outputs_${STAMP}.tar.gz"
tar -czf "$TAR" -C "$(dirname "$OUTDIR")" "$(basename "$OUTDIR")"
ls -lh "$TAR"
echo "Upload to Zenodo/Figshare, then put DOI in README."
