#!/usr/bin/env Rscript
library(tidyverse)
library(data.table)
message("Reading Yuan BLUEs...")
blues <- fread("data/raw/yuan/BLUEs_across_env.tsv")
blues_long <- blues %>%
  pivot_longer(cols = -c(Genotype, Env), names_to = "Trait", values_to = "BLUE")
fwrite(blues_long, "results/tables/yuan_blues_long.tsv", sep = "\t")
message("Done")