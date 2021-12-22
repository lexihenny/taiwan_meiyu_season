# taiwan_meiyu_season
A collection of scripts used to analyze the days that produce the most extreme precipitation in Taiwan Mei-yu season

Script names and functions are listed below *in order*.  Note: ERA5 download scripts/requests are not included

**ar_precip_sensitivity** - determines sensitivity of various precipitation metrics to AR closeness  
**ibtracs_read** - reads IBTrACs v4.0 data into an easier format  

**ep_days_define_and_definition_testing** - define EP days for a range of threshold combinations; plot seasonal AR-dominant EP day precip for these thresholds  
**ep_day_definition_testing** - assessed means and trends for the sets of EP days defined in the previous script; make plots with this information.   

**ep_days_line_plots** - display seasonal frequency and individual precipitation of EP days  
**ep_day_geotrends_overview** - plots trends in season total EP day precipitation geographically  

**ar_detection_and_weather_typing** - detects ARs based on criteria outlined in paper, and sorts EP days into 11 weather types; also plots 6-hourly maps of these days that show 850 hPa winds (arrows), MSLP (solid contours), IVT above 250 kg m-1 s-1 (grey shading), detected ARs (blue fill over IVT), tropical (red stars) and non-tropical (brown stars) IBTrACS systems, extreme precipitation, and EP day classification (upper left).  
**ivt_threshold_sensitivity_testing** - calculates trends in seasonal AR-dominant EP day frequency and precipitation based on different IVT thresholds  

**meiyu_timing_analysis** - plots occurrence rates of different EP day weather types by time of season; also near-Taiwan IVT  

**ep_days_bar_plots** - plot seasonal frequency and cumulative precipitation from different types of EP days in different seasons  
**ep_days_geoplots** - plot mean daily precipitation and seasonal cumulative precipitation trends for different types of EP days in different seasons  
**ep_day_composites** - makes synoptic composites of EP days.  Shows 1000-500 hPa thickness (dashed contours), MSLP (solid contours), IVT above 250 kg m-1 s-1 (grey shading), and detected ARs (blue fill over IVT).  
**ep_day_composite_trends** - plots trends in synoptic variables on EP days, independent of EP day frequency.  Trends are shown in 1000-500 hPa thickness, MSLP, and IVT.  

**cross_section_era5_concat** - concatenates ERA5 variables which were downloaded in chunks  
**cross_section_define** - defines cross-sections perpendicular to corridor of enhanced IVT on AR-dominant EP days; plots correlations with precipitation on these days  
**cross_section_data_slice** - used in conjunction with previous script to create a cross-section of ERA5 data  
**cross_section_analysis** - analyzes trends in moisture flux, wind speed, and specific humidity through the chosen cross-section (climatological, not just EP days)  

**tc_tracks_plot** - plots IBTrACS TC tracks in the 7 days preceding a set of dates (such as certain EP days)  
**tc_analysis_assorted** - various plots relating to variability of total and northbound TC activity, and the correlation between northbound TCs and subsequent conditions in Taiwan  
**tc_analysis_northbound** - composites of conditions preceding (or after) AR-dominant EP days associated with preceding northbound TCs (or not)  

**Q_vectors_synoptic** - plots a variety of synoptic fields on specified EP days (Q-vectors, MFC, IVT and winds, upper-level, etc.).  Also plots synoptic setup and precipitation at a single time step  


(no specific order) **seasonal_climatology_trends** - plots means and trends of MSLP and IVT for each season as a whole (not just EP days)  
