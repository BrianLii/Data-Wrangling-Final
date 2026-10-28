# Data Wrangling Project Description

## Team members: Cody Wood and Brian Li

## Project Idea

*What impact does weather have on the observed salamander population in Barton Springs?*

Our idea is to explore what impact weather patterns in the Austin area have on the Barton Springs salamander population. To do this, we will use three datasets for comparison. The first, “Barton Springs Salamanders DO and Flow”, provided by the City of Austin, has fields related to the number of salamanders photographed. We will compare that data with the dataset, “Weather CSV File” , provided by the CORGIS Dataset Project, which contains data on weather patterns, such as the average amount of rain, by city in the USA. Finally, the third dataset is “Watershed Reach Integrity Scores”, provided by the City of Austin, and containing data on water level elevation in the city’s lakes. Hypothetically, there should be an increase in salamander population following longer periods of downpour.

## Datasets

1. Salamander data: *Barton Springs Salamanders DO and Flow* [https\://data.austintexas.gov/Environment/Barton-Springs-Salamanders-DO-and-Flow/pyic-v8yf/about\_data](https://data.austintexas.gov/Environment/Barton-Springs-Salamanders-DO-and-Flow/pyic-v8yf/about_data)  
2. Weather data: *CORGIS Dataset Project*  
   [https\://corgis-edu.github.io/corgis/csv/weather/](https://corgis-edu.github.io/corgis/csv/weather/)  
3. Watershed data: *Watershed Reach Integrity Scores*  
   [https\://data.austintexas.gov/Environment/Watershed-Reach-Integrity-Scores/jnhv-r76c/about\_data](https://data.austintexas.gov/Environment/Watershed-Reach-Integrity-Scores/jnhv-r76c/about_data)

## Goals

1. We would like to explore what impact weather has on the observed salamander population in Barton Springs, if any.  
2. We would like to join the three databases (or others we discover) and manipulate the data in a way that allows for meaningful comparison, insights, and analysis.

## Data Sources and Transformations

The Barton Springs Salamanders DO and Flow data can be filtered to show only the number of salamanders photographed (observed).   
In the filtered and manipulated data, you can see that there are fluctuations in observed salamander numbers over time. 

The CORGIS Weather.csv data allows us to see precipitation levels, as well as the average temperature and wind speed. We can compare this to the observed salamander numbers to see if there is an impact.   
Note: Weather.csv only covers from around 2016 \- 2017, so we would need to filter our data to match.

To combine these datasets, we will select one Austin weather station and match each salamander survey to the corresponding weekly weather record. We will use a left join to retain the salamander observations and add precipitation, temperature, and wind speed as columns. We will standardize date formats and check for missing values and duplicate records before joining.

We may also create lagged precipitation variables to compare observed salamander counts with weather in preceding weeks, since any response may not be immediate. If we include dissolved oxygen or flow, we will reshape those measurements from long to wide format and match them by site and sampling event where possible. These steps will help us examine associations between weather and observed counts while keeping observations from different spring sites separate.

## Additional Data Sources

* Water data from USGS: [https\://waterdata.usgs.gov/monitoring-location/USGS-08155500/statistics\#selectedDataTypes=daily-00010-0](https://waterdata.usgs.gov/monitoring-location/USGS-08155500/statistics#selectedDataTypes=daily-00010-0)![][image1]  
* [Weather.gov](http://Weather.gov) has a dataset with record-setting temperatures and precipitation levels: [https\://www\.weather.gov/wrh/climate?wfo=ewx\&tab=cliplot\&sid=AUSthr\&view=monthly\&month=2026-09](https://www.weather.gov/wrh/climate?wfo=ewx&tab=cliplot&sid=AUSthr&view=monthly&month=2026-09)  
  ![][image2]  
* Weather Underground offers similar temperature and precipitation data:  
  [https\://www\.wunderground.com/history/monthly/us/tx/austin](https://www.wunderground.com/history/monthly/us/tx/austin)![][image3]

