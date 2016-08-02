---
layout: post
title: "How R Packages are Licensed"
date: 2016-08-02 12:30:00
jumbo_title: How R Packages are Licensed
jumbo_subtitle:
---

I was researching R packages and I wanted to get a sense of how they are
licensed on CRAN. I've also been wanting to take Bob Rudis'
[waffle](https://github.com/hrbrmstr/waffle) package for a spin since I read a
[study](https://eagereyes.org/blog/2016/an-illustrated-tour-of-the-pie-chart-study-results)
by [Robert Kosara](https://twitter.com/eagereyes) and
[Drew Skau](https://twitter.com/seeingstructure)
saying that waffle charts (square shaped pie charts) are easier to read compared
to pie charts. Below is a waffle chart illustrating the major open source
licensing families among R packages on CRAN.


    library(dplyr)
    library(magrittr)
    library(purrr)
    library(waffle)
    library(ggplot2)
    
    # The sorting hat will map the License field in a DESCRIPTION file
    # to an open source license family.
    sorting_hat <- function(student, houses){
      choice <- map_lgl(houses, grepl, x = student)
      if(!any(choice)){
        return("Other")
      } else {
        return((houses[choice])[1])
      }
    }
    
    # Get the data from CRAN
    license_table <- table(available.packages()[,"License"])
    
    # Sort licenses into families
    names(license_table) %<>%
      map_chr(function(x){
        sorting_hat(x, c("Apache", "Artistic", "CC", "BSD", "MIT", "GPL"))
      })  
    
    # Tidy the data and plot!
    license_tbl <- as.data.frame(license_table) %>%
      rename(License = Var1) %>%
      group_by(License) %>%
      summarize(Freq = sum(Freq)) %>%
      ungroup() %>%
      arrange(desc(Freq))
    
    licenses <- license_tbl$Freq
    names(licenses) <- license_tbl$License
    
    waffle(licenses/50, rows = 10,
           title = "How R Packages on CRAN are Licensed",
           xlab = "1 Square = 50 R Packages") +
      theme(legend.text=element_text(size=15), axis.title.x = element_text(size=15))

![center](/img/2016-08-02-How-R-Packages-are-Licensed/unnamed-chunk-1-1.png){: .img-thumbnail max-width="100%" height="auto"}
