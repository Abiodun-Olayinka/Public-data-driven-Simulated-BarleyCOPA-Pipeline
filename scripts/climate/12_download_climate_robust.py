#!/usr/bin/env python3
import pandas as pd
import yaml
def download_climate_for_sites(config_file, output_dir):
    with open(config_file, 'r') as f:
        config = yaml.safe_load(f)
    for site in config['sites']:
        print(f"Downloading data for {site['name']}...")
if __name__ == "__main__":
    download_climate_for_sites("config/sites_climate.yaml", "data/climate/raw")