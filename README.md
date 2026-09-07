# Public-data-driven Simulated BarleyCOPA Pipeline

Reproducible host-environment-pathogen analytics for barley disease resistance using public multi-environment phenotypes, host genotypes, climate covariates, and Ramularia collo-cygni isolate genomes.

Aligned with BarleyCOPA-style GxGxE aims. Large VCFs are not stored in Git. See docs/02_data_sources.md.

Local heavy data: BARLEYCOPA_HOME (default ~/Documents/BarleyCOPA).

## Scope

| Module | Public data |
|--------|-------------|
| Yuan multi-env phenotypes, GxE, breeding ranks | Supported |
| Host GWAS (GCTA MLMA/LOCO), candidates, gene windows | Supported (Elite; power-limited) |
| DWD climate x trial environments | Supported |
| R. collo-cygni QC + PCA | Supported |
| Host x pathogen x env co-GWAS | Requires designed trials |

## Pipeline

1. Yuan phenotypes -> BLUEs / G-BLUPs / ranks
2. Host VCF -> QC -> PLINK -> GCTA MLMA/LOCO -> candidates
3. DWD climate -> site-year indices -> Env map
4. Pathogen VCF -> QC -> PCA

## Requirements

R (>=4.3), Python (>=3.10), bcftools, PLINK2, GCTA, bedtools, bgzip/tabix.

    bash scripts/utils/check_tools.sh

## Quick start

    git clone https://github.com/Abiodun-Olayinka/Public-data-driven-Simulated-BarleyCOPA-Pipeline.git
    cd Public-data-driven-Simulated-BarleyCOPA-Pipeline
    export BARLEYCOPA_HOME="${BARLEYCOPA_HOME:-$HOME/Documents/BarleyCOPA}"
    bash scripts/00_setup_dirs.sh

Place data per docs/02_data_sources.md, then run scripts in order (docs/03_pipeline_phases.md).

## Scripts

| Folder | Scripts |
|--------|---------|
| scripts/phenotype/ | 01-04 Yuan / GxE / breeding |
| scripts/genotype/ | 05-08 match, VCF, PLINK, GCTA |
| scripts/gwas_post/ | 09-11 concordant hits, clump, genes |
| scripts/climate/ | 12-15 DWD download and Env map |
| scripts/pathogen/ | 16-18 download, QC, PCA |
| scripts/utils/ | check_tools.sh |

## Docs

- docs/01_overview.md
- docs/02_data_sources.md
- docs/03_pipeline_phases.md
- docs/04_results_summary.md
- docs/05_limitations_and_gxgxe.md

## Citation

Yuan et al. https://doi.org/10.5447/ipk/2024/7
Zenodo R. collo-cygni https://zenodo.org/records/3256422
This repo: CITATION.cff

## License

MIT — see LICENSE.
