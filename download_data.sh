#!/bin/sh
# Downloads the three project datasets into data/. Re-run to refresh.
set -e
cd "$(dirname "$0")"
mkdir -p data/salamander data/weather data/watershed
curl -fL -o data/salamander/salamander.csv "https://data.austintexas.gov/api/views/pyic-v8yf/rows.csv?accessType=DOWNLOAD"
curl -fL -o data/watershed/watershed.csv "https://data.austintexas.gov/api/views/jnhv-r76c/rows.csv?accessType=DOWNLOAD"
curl -fL -o data/weather/weather.csv "https://corgis-edu.github.io/corgis/datasets/csv/weather/weather.csv"
