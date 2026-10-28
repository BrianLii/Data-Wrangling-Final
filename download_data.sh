#!/bin/sh
# Downloads the three project datasets into data/. Re-run to refresh.
set -e
cd "$(dirname "$0")"
mkdir -p data/salamander data/weather data/watershed
curl -fL -o data/salamander/salamander.csv "https://data.austintexas.gov/api/views/pyic-v8yf/rows.csv?accessType=DOWNLOAD"
curl -fL -o data/watershed/watershed.csv "https://data.austintexas.gov/api/views/jnhv-r76c/rows.csv?accessType=DOWNLOAD"
curl -fL -o data/weather/weather.csv "https://corgis-edu.github.io/corgis/datasets/csv/weather/weather.csv"

# USGS 08155500 (Barton Springs at Austin): daily mean water temperature, deg C
mkdir -p data/usgs
curl -fL -o data/usgs/usgs_08155500_temp.tsv "https://waterservices.usgs.gov/nwis/dv/?format=rdb&sites=08155500&parameterCd=00010&statCd=00003&startDT=1990-01-01&endDT=$(date +%F)"

# NWS Austin-Bergstrom area daily temp/precip, from the ACIS API behind weather.gov's climate page
mkdir -p data/weathergov
curl -fL -H 'Content-Type: application/json' -o data/weathergov/austin_daily.json \
  -d "{\"sid\":\"AUSthr 9\",\"sdate\":\"2000-01-01\",\"edate\":\"$(date +%F)\",\"elems\":[{\"name\":\"maxt\"},{\"name\":\"mint\"},{\"name\":\"avgt\"},{\"name\":\"pcpn\"}],\"output\":\"json\"}" \
  https://data.rcc-acis.org/StnData
python3 -I -c "
import json,csv
d=json.load(open('data/weathergov/austin_daily.json'))['data']
w=csv.writer(open('data/weathergov/austin_daily.csv','w',newline=''))
w.writerow(['date','max_temp_f','min_temp_f','avg_temp_f','precip_in']); w.writerows(d)"
