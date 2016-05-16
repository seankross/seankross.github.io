---
layout: post
title: "Drone Visualization Challenge"
date: 2016-04-05 20:00:00
jumbo_title: Drone Visualization Challenge
jumbo_subtitle:
---

I'm throwing my hat into the ring with this very last
minute submission to [Bob Rudis](https://twitter.com/hrbrmstr)'
weekly visualization [challenge](https://rud.is/b/2016/03/30/introducing-a-weekly-r-python-js-etc-vis-challenge/). First a bit of self-promotion using the minimap
package:


    library(dplyr)
    library(readxl)
    library(minimap)
    library(magrittr)
    library(RColorBrewer)
    library(stringr)
    library(lubridate)
    
    drone1 <- read_excel("~/Developer/R/drones/UASEventsNov2014-Aug2015.xls")

    ## DEFINEDNAME: 00 00 00 06 0b 00 00 00 01 00 00 00 00 00 00 6f 77 73 73 76 72 3b 00 00 00 00 fc 02 00 00 05 00 
    ## DEFINEDNAME: 00 00 00 06 0b 00 00 00 01 00 00 00 00 00 00 6f 77 73 73 76 72 3b 00 00 00 00 fc 02 00 00 05 00 
    ## DEFINEDNAME: 00 00 00 06 0b 00 00 00 01 00 00 00 00 00 00 6f 77 73 73 76 72 3b 00 00 00 00 fc 02 00 00 05 00 
    ## DEFINEDNAME: 00 00 00 06 0b 00 00 00 01 00 00 00 00 00 00 6f 77 73 73 76 72 3b 00 00 00 00 fc 02 00 00 05 00

    drone2 <- read_excel("~/Developer/R/drones/UAS_Sightings_report_21Aug-31Jan.xlsx")
    
    drone <- data.frame(DT = c(drone1$EventDATETIME, drone2$EventDATETIME),
                        City = c(drone1$LocationCITY, drone2$LocationCITY),
                        State = c(drone1$LocationSTATE, drone2$LocationSTATE),
                        stringsAsFactors = FALSE)
    
    state_name <- c(state.name, "District of Columbia")
    
    drone %<>%
      arrange(desc(DT)) %>%
      filter(State %in% state_name)
    
    drone$State_abb <- sapply(drone$State, function(x){
      usa_abb[grep(paste0("^", x, "$"), state_name)]
    })
    
    drone_by_state <- drone %>%
      group_by(State_abb) %>%
      summarize(n = n()) %>%
      mutate(col = colorRampPalette(c("#FCFBFD", "#3F007D"))(299)[n])
    
    drone_by_state <- rbind(drone_by_state, data.frame(State_abb = setdiff(usa_abb, drone_by_state$State_abb), n = rep(0, 4), col = rep("#FFFFFF", 4), stringsAsFactors = FALSE))
    drone_by_state$name_col <- sapply(drone_by_state$col, function(x){
      color <- col2rgb(x)
      if((color[1]*0.299 + color[2]*0.587 + color[3]*0.114) > 186){
        "#000000"
      } else {
        "#ffffff"
      }
    })
    
    opar <- par(no.readonly = TRUE)
    par(xpd = TRUE)
    miniusa(drone_by_state$State_abb, drone_by_state$col, 
            state_name_colors = drone_by_state$name_col)
    mtext("Drone Sightings by State", cex = 1.5, line = -1)
    legend(10, 2, c("50", "100", "200", "300"), pch = rep(15, 4),
           col = colorRampPalette(c("#FCFBFD", "#3F007D"))(299)[c(50, 100, 200, 299)], bty = "n")

![center](/img/2016-04-05-Drone-Visualization-Challenge/unnamed-chunk-1-1.png){: .img-thumbnail max-width="100%" height="auto"}

Then I wondered: what kinds of weather conditions do drone
operators like to fly in?


    library(rnoaa)
    
    # Get your token here: http://www.ncdc.noaa.gov/cdo-web/token
    options(noaakey = "")
    
    locations1 <- ncdc_locs(locationcategoryid='CITY', 
                           sortfield='name', sortorder='desc', 
                           limit = 1000)
    locations2 <- ncdc_locs(locationcategoryid='CITY', 
                            sortfield='name', sortorder='desc', 
                            limit = 1000, offset = 1001)
    locations <- rbind(locations1$data, locations2$data, 
                       stringsAsFactors = FALSE)
    
    locations %<>%
      mutate(City = regmatches(name, regexpr("[^,]*", name))) %>%
      filter(grepl("CITY:US", id)) %>%
      mutate(State_abb = regmatches(name, regexpr("[^,]*$", name))) %>%
      mutate(State_abb = substr(State_abb, 2, 3)) %>%
      select(id, City, State_abb)
    
    drone %<>%
      left_join(locations)
      
    drone_weather <- drone %>%
      filter(!is.na(id)) %>%
      mutate(date = as.character(as.Date(DT)))
    drone_weather$tmax <- rep(NA, nrow(drone_weather))
    drone_weather$tmin <- rep(NA, nrow(drone_weather))
    
    response <- list()
    
    for(i in 1:nrow(drone_weather)){
      response[[i]] <- ncdc(datasetid='GHCND', locationid = drone_weather$id[i],
                       startdate = drone_weather$date[i], datatypeid = c("TMAX", "TMIN"),
                       enddate = drone_weather$date[i], limit=500)
    }
    
    for(i in 1:length(response)){
      drone_weather$tmax[i] <- mean(response[[i]]$data$value[response[[i]]$data$datatype == "TMAX"])
      drone_weather$tmin[i] <- mean(response[[i]]$data$value[response[[i]]$data$datatype == "TMIN"])
    }



Due to data being unavailable and personal lack of know-how
there are only 165 drone sightings which
have temperate data.


    drone_weather %<>%
      filter(!is.na(tmin)) %>%
      mutate(tmax = tmax/10, tmin = tmin/10)
    
    h1 <- hist(drone_weather$tmax, breaks = 15)
    h2 <- hist(drone_weather$tmin, breaks = 15)


    plot(h1, col = rgb(1, 0, 0, .6), main = "Temperature During Drone Sightings",
         xlab = "Temperature (C)", xlim = c(-5, 40))
    plot(h2, col = rgb(0, 0, 1, .6), main = "Temperature During Drone Sightings",
         xlab = "Temperature (C)", add = TRUE)
    legend(32, 20, c("Daily High", "Daily Low"), pch = rep(15, 2),
           col = c(rgb(1, 0, 0, .6), rgb(0, 0, 1, .6)), bty = "n")

![center](/img/2016-04-05-Drone-Visualization-Challenge/unnamed-chunk-5-1.png){: .img-thumbnail max-width="100%" height="auto"}


    drone_weather %<>%
      mutate(tmax = tmax*(9/5)+32, tmin = tmin*(9/5)+32)
    
    h1 <- hist(drone_weather$tmax, breaks = 15)
    h2 <- hist(drone_weather$tmin, breaks = 15)


    plot(h1, col = rgb(1, 0, 0, .6), main = "Temperature During Drone Sightings",
         xlab = "Temperature (F)", xlim = c(20, 110), ylim = c(0, 40))
    plot(h2, col = rgb(0, 0, 1, .6), main = "Temperature During Drone Sightings",
         xlab = "Temperature (F)", add = TRUE)
    legend(20, 20, c("Daily High", "Daily Low"), pch = rep(15, 2),
           col = c(rgb(1, 0, 0, .6), rgb(0, 0, 1, .6)), bty = "n")

![center](/img/2016-04-05-Drone-Visualization-Challenge/unnamed-chunk-7-1.png){: .img-thumbnail max-width="100%" height="auto"}
