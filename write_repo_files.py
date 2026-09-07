from pathlib import Path

root = Path(".")
for d in [
    "docs", "config", "scripts/utils", "scripts/pathogen",
    "scripts/climate", "results/examples",
]:
    (root / d).mkdir(parents=True, exist_ok=True)

def w(path, text):
    p = root / path
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(text.strip() + "\n")
    print("wrote", path)

w("README.md", """
# Public-data-driven Simulated BarleyCOPA Pipeline

Public-data workflow for barley disease resistance:
phenotypes, host GWAS, climate covariates, and Ramularia pathogen genomics.

Large VCF and genotype files are not stored in Git.
See the docs/ folder for data sources and pipeline phases.

## Local analysis

Heavy data lives under ~/Documents/BarleyCOPA.
This repository holds scripts and documentation only.

## License

MIT. See LICENSE.
""")

w("docs/01_overview.md", """
# Overview

Public-data pipeline aligned with BarleyCOPA-style aims.
Modules: phenotypes, host GWAS, climate, pathogen structure.
True GxGxE requires matched host x isolate trials.
""")

w("docs/02_data_sources.md", """
# Data sources

- Yuan phenotypes: https://doi.org/10.5447/ipk/2024/7
- Host genotypes: ENA (e.g. PRJEB80159) - do not commit VCFs
- Climate: DWD via wetterdienst; see config/sites_climate.yaml
- Pathogen: https://zenodo.org/records/3256422
""")

w("docs/03_pipeline_phases.md", """
# Pipeline phases

0. Setup dirs and check tools
1. Phenotypes (Yuan)
2. Host GxE / G-BLUPs
3. Host GWAS (GCTA MLMA/LOCO)
4. Climate download and Env join
5. Pathogen QC and PCA
6. Reporting (small tables only in git)
""")

w("docs/04_results_summary.md", """
# Example results

Elite GWAS: suggestive Ramularia loci (power-limited).
Climate: site-year DWD indices for German trials.
Pathogen: 19 isolates; PCA of QC SNPs.
""")

w("docs/05_limitations_and_gxgxe.md", """
# Limitations

- Elite sample size limits GWAS power
- Climate is station-based, not on-field
- No public host x isolate disease matrix
- Full GxGxE needs designed phenotyping trials
""")

w("CITATION.cff", """
cff-version: 1.2.0
title: Public-data-driven Simulated BarleyCOPA Pipeline
message: If you use this software, please cite it.
type: software
authors:
  - family-names: Olayinka
    given-names: Abiodun
repository-code: https://github.com/Abiodun-Olayinka/Public-data-driven-Simulated-BarleyCOPA-Pipeline
license: MIT
version: 1.0.0
date-released: 2026-09-07
""")

w("config/sites_climate.yaml", """
sites:
  - name: KWS_Prosselsheim
    lat: 49.8543
    lon: 10.1011
  - name: Nordic_Seed_Nienstaedt
    lat: 52.2932
    lon: 9.1492
  - name: Bauer_Riekofen
    lat: 48.9156
    lon: 12.3560
  - name: Limagrain_Peine
    lat: 52.3027
    lon: 10.1746
  - name: Nordsaat_Gudow
    lat: 53.5578
    lon: 10.7974
  - name: Secobra_Lemgo
    lat: 52.0116
    lon: 8.8730
  - name: Secobra_Moosburg
    lat: 48.4797
    lon: 11.9091
""")

w("config/paths.example.yaml", """
barleycopa_home: /Users/YOURUSER/Documents/BarleyCOPA
yuan_dir: data/raw/yuan
pathogen_vcf: data/pathogen/ramularia/Annot_RccAll.vcf.gz
""")

w("scripts/00_setup_dirs.sh", """
#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
mkdir -p "$ROOT/data/raw/yuan" "$ROOT/data/pathogen/ramularia"
mkdir -p "$ROOT/results/pathogen" "$ROOT/results/breeding" "$ROOT/logs"
echo "Created: $ROOT"
""")

w("scripts/utils/check_tools.sh", """
#!/usr/bin/env bash
echo "Checking tools..."
for t in Rscript python3 bcftools plink2 bgzip bedtools; do
  if command -v "$t" >/dev/null 2>&1; then
    echo "  OK  $t"
  else
    echo "  MISSING  $t"
  fi
done
""")

w("scripts/pathogen/16_download_pathogen.sh", """
#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
OUT="$ROOT/data/pathogen/ramularia"
mkdir -p "$OUT"
cd "$OUT"
curl -L --retry 10 -C - -o Annot_RccAll.vcf \\
  "https://zenodo.org/records/3256422/files/Annot_RccAll.vcf?download=1"
ls -lh Annot_RccAll.vcf
""")

w("scripts/pathogen/18_pathogen_pca.sh", """
#!/usr/bin/env bash
set -euo pipefail
ROOT="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
DIR="$ROOT/data/pathogen/ramularia"
RES="$ROOT/results/pathogen"
mkdir -p "$RES"
cd "$DIR"
plink2 --bfile Rcc_qc --freq --out "$RES/rcc_freq" --allow-extra-chr
plink2 --bfile Rcc_qc --read-freq "$RES/rcc_freq.afreq" --pca 5 \\
  --out "$RES/rcc_pca" --allow-extra-chr
""")

w("environment.yml", """
name: barleycopa-public
channels:
  - conda-forge
  - bioconda
dependencies:
  - python>=3.10
  - pandas
  - pip
  - bcftools
  - plink2
  - pip:
      - wetterdienst
""")

w("requirements.txt", """
wetterdienst>=0.100
pandas>=2.0
""")

w("results/examples/README.md", """
# Example outputs

Small illustrative tables only. Large results stay local.
""")

for sh in root.glob("scripts/**/*.sh"):
    sh.chmod(0o755)

print("DONE")
