---
layout: post
title: "Mise en Abyme"
date: 2017-03-02 11:10:00
jumbo_title: Mise en Abyme
jumbo_subtitle: You got Plotly in my Leaflet!
---

Yesterday [Roger Peng](https://twitter.com/rdpeng),
[Brooke Anderson](https://twitter.com/gbwanderson), and I were working on the
last part of our [Mastering Software Development in R](https://leanpub.com/msdr) 
specialization on Coursera and we started talking about the 
[explosion](http://www.htmlwidgets.org/) of Javascript-based interactive
graphics packages that have come out for R. We then started seriously discussing
the capstone project of the specialization, down to the gritty details
of how we wanted students to convert rows in a certain data frame into nicely
formatted HTML that could be displayed in a 
[Leaflet](https://rstudio.github.io/leaflet/) marker popup. The discussion got
me thinking: what are the limits to what you can put into Leaflet marker popup?
Could you, for example, put an interactive [Plotly](https://plot.ly/r/)
scatter plot in a popup? The resulting monstrosity is below:



{% highlight r %}
library(leaflet)

popup <- '<iframe width="300" height="300" frameborder="0" scrolling="no" src="https://plot.ly/~seankross/1.embed"></iframe>'

leaflet() %>%
  addTiles() %>%
  addMarkers(lng=174.768, lat=-36.852, popup=popup)
{% endhighlight %}

<iframe width="100%" height="500" frameborder="0" scrolling="no" src="https://seankross.neocities.org/map.html"></iframe>

If you want to do this yourself start by creating a graph using Plotly, and
then [upload it](https://plot.ly/r/getting-started/) to your Plotly account.
Once you've uploaded the graph you can then 
[get an embeddable iframe](http://help.plot.ly/embed-graphs-in-websites/) that
you can supply as the `popup` argument in `addMarkers()`.

I showed this insanity to Brooke and Roger, and Brooke mentioned that it
reminder her of the artistic concept of
[mise en abyme](https://en.wikipedia.org/wiki/Mise_en_abyme) (literally: placed 
into abyss), which describes the experience of
standing between two mirrors. The next logical question for the three of us was:
what are the limits of using an `<iframe>` in a Leaflet popup? How deep does
this rabbit hole go? I uploaded [my first map](https://seankross.neocities.org/map.html)
and attempted to embed that site into yet another iframe:


{% highlight r %}
library(leaflet)

popup <- '<iframe width="300" height="600" frameborder="0" scrolling="no" src="https://seankross.neocities.org/map.html"></iframe>'

leaflet() %>%
  addTiles() %>%
  addMarkers(lng=174.768, lat=-36.852, popup=popup)
{% endhighlight %}

<iframe width="100%" height="650" frameborder="0" scrolling="no" src="https://seankross.neocities.org/mapmap.html"></iframe>

If you place yourself into the abyss, the abyss stares back at you.
