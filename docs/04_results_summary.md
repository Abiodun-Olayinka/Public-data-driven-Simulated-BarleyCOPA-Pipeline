# Results summary (public-data pipeline)

Illustrative files live in results/examples/. Full VCFs are not stored in Git.

## 1. Yuan disease BLUEs

| Trait | n | Mean | Min | Max |
|-------|---|------|-----|-----|
| Ramularia | 1176 | 3.76 | 0.77 | 8.55 |
| Scald | 1184 | 1.69 | 0.94 | 6.46 |
| Powdery mildew | 1189 | 3.67 | -2.54 | 7.60 |
| Leaf rust | 1194 | 4.33 | 1.70 | 8.09 |
| Net blotch | 1172 | 1.74 | 1.12 | 4.29 |

## 2. Host GWAS (Elite spring, n=128)

About 20.2 M QC SNPs. GCTA MLMA + LOCO.

Concordant Ramularia loci (p less than 1e-5 in both):

| SNP | Chr | bp | p_MLMA | p_LOCO |
|-----|-----|-----|--------|--------|
| chr3H_117530271_C_T | 3H | 117530271 | 5.81e-06 | 9.63e-06 |
| chr2H_201244673_G_A | 2H | 201244673 | 7.48e-06 | 7.53e-06 |
| chr6H_259842824_T_C | 6H | 259842824 | 7.59e-06 | 1.76e-06 |
| chr6H_250730963_C_T | 6H | 250730963 | 9.00e-06 | 2.65e-06 |

Figure: results/examples/figures/manhattan_sketch_ramularia_example.png

Caveat: small sample size; signals are suggestive only.

## 3. Climate (DWD site-year)

Example: Nordsaat_Gudow 2020 mean temperature 10.41 C, precip 677.6 mm.
Table: climate_indices_by_site_year_example.tsv
Figure: figures/climate_precip_by_site_year_example.png

## 4. Pathogen PCA (R. collo-cygni, n=19)

PC1-5 variance explained: 13.8%, 11.1%, 8.2%, 6.5%, 5.6%.
Figure: figures/pathogen_pca_example.png

## 5. Full archives

Run: bash scripts/utils/package_for_zenodo.sh
Upload the tar.gz to Zenodo or Figshare, then put the DOI in the README.
