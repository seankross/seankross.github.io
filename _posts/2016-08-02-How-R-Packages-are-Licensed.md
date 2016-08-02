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

## Update (Bioconductor)

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/seankross">@seankross</a> <a href="https://twitter.com/rdpeng">@rdpeng</a> <a href="https://twitter.com/hrbrmstr">@hrbrmstr</a> Cool. With <a href="https://twitter.com/Bioconductor">@bioconductor</a> (v3.3) pkgs included there are 1148 Artistic-2.0, 8975 GPL(*), 1169 other <a href="https://twitter.com/hashtag/rstats?src=hash">#rstats</a></p>&mdash; Gabe Becker (@groundwalkergmb) <a href="https://twitter.com/groundwalkergmb/status/760524247768961024">August 2, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Thanks for the idea Gabe. Below is a look at the licenses for packages on
Bioconductor.


    library(BiocInstaller)
    bioc_table <- table(available.packages(contrib.url(biocinstallRepos())[1:4])[,"License"])
    
    # Sort licenses into families
    names(bioc_table) %<>%
      map_chr(function(x){
        sorting_hat(x, c("Artistic", "CC", "BSD", "MIT", "LGPL", "GPL"))
      })  
    
    # Tidy the data and plot!
    bioc_tbl <- as.data.frame(bioc_table) %>%
      rename(License = Var1) %>%
      group_by(License) %>%
      summarize(Freq = sum(Freq)) %>%
      ungroup() %>%
      arrange(desc(Freq))
    
    bioc <- bioc_tbl$Freq
    names(bioc) <- bioc_tbl$License
    
    waffle(bioc/10, rows = 12,
           title = "How R Packages on Bioconductor are Licensed",
           xlab = "1 Square = 10 R Packages",
           colors = c("#E5C494", "#66C2A5", "#FFD92F", "#E78AC3", 
                      "#FC8D62", "#8DA0CB", "#A6D854")) +
      theme(legend.text=element_text(size=15), axis.title.x = element_text(size=15))

![center](/img/2016-08-02-How-R-Packages-are-Licensed/unnamed-chunk-2-1.png){: .img-thumbnail max-width="100%" height="auto"}
