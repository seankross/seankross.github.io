---
layout: post
title: "mtcars as a Service"
date: 2014-08-01 13:00:00
jumbo_title: mtcars as a Service
jumbo_subtitle: 
---

<blockquote class="twitter-tweet" align="center" lang="en"><p><a href="https://twitter.com/hashtag/useR2015?src=hash">#useR2015</a> proposal. &#10;No more mtcars&#10;&#10;<a href="https://twitter.com/hashtag/useR2014?src=hash">#useR2014</a></p>&mdash; Karthik Ram (@_inundata) <a href="https://twitter.com/_inundata/statuses/484745737935126528">July 3, 2014</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br><br/>

`mtcars` is a dataset that comes packaged with R which details the specifications of 32 automobiles that appeared in *Motor Trend* in 1974. It is often used as a canonical example for visualizations and in demonstrations of new R packages. With such a loyal user base, why in 2014 are statisticians still lugging around a whole 6.74 KB of data (`object.size(mtcars)`) when they could just query the data through a JSON API? Obviously this is a ridiculous question, but how feasible is it to generate a JSON API from a CSV? 

I recently came across [Blockspring](https://api.blockspring.com) which provides an API for your Python, Ruby, and R code. Essentially you write a script, POST the values of your variables to that script, Blockspring does the computation, and the response from the POST is the result of the computation. Blockspring has a great [video](https://api.blockspring.com/blog/api-in-60-seconds) that explains this process. I uplaoded a CSV of `mtcars` to a [GitHub Gist](https://gist.github.com/seankross/a412dfbd88b3db70b74b) and now we're ready to craft our API. The ["mtcars as a service"](https://api.blockspring.com/users/seankross/blocks/b71b0fc28a18e6d58b1dbf55e7c00c59) API takes as arguments minimum and maximum values for each column in `mtcars` and returns only rows that satisfy those constraints. This is accomplished using the [dplyr](https://github.com/hadley/dplyr) and RJSONIO packages. You can view the source code for the Blockspring script [here](https://gist.github.com/seankross/89073d5c39abae28f899).

I wrote an R function for interacting with the mtcars API which you can view [here](https://gist.github.com/seankross/4a504e1cd94c3d870be3). You can use it too if you get an API key from Blockspring. Here's an example using it:

```r
# make sure you have devtools, httr, and RJSONIO installed, or you can run:
# install.packages(c("devtools", "httr", "RJSONIO"))

library(devtools)
source_gist("4a504e1cd94c3d870be3")
mtcars_aaS("YOUR_API_KEY", mpg_max = "15")
```

```
                model  mpg cyl disp  hp drat    wt  qsec vs am gear carb
1          Duster 360 14.3   8  360 245 3.21 3.570 15.84  0  0    3    4
2  Cadillac Fleetwood 10.4   8  472 205 2.93 5.250 17.98  0  0    3    4
3 Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4
4   Chrysler Imperial 14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
5          Camaro Z28 13.3   8  350 245 3.73 3.840 15.41  0  0    3    4
6       Maserati Bora 15.0   8  301 335 3.54 3.570 14.60  0  1    5    8
```

Without touching a server and by writing only in R, I have a functioning API for `mtcars`! If you need to get a data API up and running quickly I think Blockspring is a viable option and a generally cool piece of technology.