---
layout: post
title: "An Irresponsibly Brief Introduction to the Tidyverse"
date: 2020-01-29 12:00:00
jumbo_title: An Irresponsibly Brief Introduction to the Tidyverse
---

While attending RStudio::conf 2020 a couple people asked me for a very
lightweight introduction to the [Tidyverse](https://www.tidyverse.org/),
a collection of some of the
most useful R packages that are designed to work well together. I thought I
would try writing the most concise introduction possible for people who are in
a hurry or only want a little taste of what is out there.

## Setting Up

First install the Tidyverse:


{% highlight r %}
install.packages("tidyverse")
{% endhighlight %}

Then load the Tidyverse:


{% highlight r %}
library(tidyverse)
{% endhighlight %}



{% highlight text %}
## ── Attaching packages ──────────────────────────────────────────────── tidyverse 1.3.0 ──
{% endhighlight %}



{% highlight text %}
## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.4.0
{% endhighlight %}



{% highlight text %}
## ── Conflicts ─────────────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
{% endhighlight %}

## Using the Pipe Operator

If you have used R before you probably know how to create sequences of
integers with the colon (`:`) operator:


{% highlight r %}
1:10
{% endhighlight %}



{% highlight text %}
##  [1]  1  2  3  4  5  6  7  8  9 10
{% endhighlight %}

If you wanted to know the sum of all of the numbers between 1 and 10 you might
write some code like:


{% highlight r %}
sum(1:10)
{% endhighlight %}



{% highlight text %}
## [1] 55
{% endhighlight %}

The Tidyverse makes heavy use of the pipe operator (`%>%`), which takes
whatever is on the left-hand-side of the pipe and makes it the first argument
of whatever function is on the right-hand-side of the pipe. 
Therefore `1:10 %>% sum()` is equivalent to `sum(1:10)`.


{% highlight r %}
1:10 %>% sum()
{% endhighlight %}



{% highlight text %}
## [1] 55
{% endhighlight %}

The Tidyverse is largely concerned with manipulating data frames. One of my
favorite data frames that is built into R is called `trees`. The Tidyverse has
its own kind of data frame called a tibble. Let's turn `trees` into a tibble
for our future convenience:


{% highlight r %}
(trees <- trees %>% as_tibble())
{% endhighlight %}



{% highlight text %}
## # A tibble: 31 x 3
##    Girth Height Volume
##    <dbl>  <dbl>  <dbl>
##  1   8.3     70   10.3
##  2   8.6     65   10.3
##  3   8.8     63   10.2
##  4  10.5     72   16.4
##  5  10.7     81   18.8
##  6  10.8     83   19.7
##  7  11       66   15.6
##  8  11       75   18.2
##  9  11.1     80   22.6
## 10  11.2     75   19.9
## # … with 21 more rows
{% endhighlight %}

I put the above code in parentheses so that you could see how the resulting
tibble prints nicely. Notice that the dimensions of the rows and columns of
this tibble are printed at the top where it says `# A tibble: 31 x 3`.

## Create New Columns from Existing Data

The Volume variable represents the volume of the tree in cubic feet. Let's
**create a new column** that specifies whether it is a small tree
using `mutate()`. Let's say that a small tree has a Volume less than 19.
In the code below you can specify that the name of the new column will be 
Small_Tree.


{% highlight r %}
trees %>% 
  mutate(Small_Tree = Volume < 19)
{% endhighlight %}



{% highlight text %}
## # A tibble: 31 x 4
##    Girth Height Volume Small_Tree
##    <dbl>  <dbl>  <dbl> <lgl>     
##  1   8.3     70   10.3 TRUE      
##  2   8.6     65   10.3 TRUE      
##  3   8.8     63   10.2 TRUE      
##  4  10.5     72   16.4 TRUE      
##  5  10.7     81   18.8 TRUE      
##  6  10.8     83   19.7 FALSE     
##  7  11       66   15.6 TRUE      
##  8  11       75   18.2 TRUE      
##  9  11.1     80   22.6 FALSE     
## 10  11.2     75   19.9 FALSE     
## # … with 21 more rows
{% endhighlight %}

## Pick Out Only the Data You Want

Imagine that you only want to look at trees that have a Height greater than 70.
You can use `filter()` to **eliminate rows** from a tibble:


{% highlight r %}
trees %>% 
  mutate(Small_Tree = Volume < 19) %>% 
  filter(Height > 70)
{% endhighlight %}



{% highlight text %}
## # A tibble: 25 x 4
##    Girth Height Volume Small_Tree
##    <dbl>  <dbl>  <dbl> <lgl>     
##  1  10.5     72   16.4 TRUE      
##  2  10.7     81   18.8 TRUE      
##  3  10.8     83   19.7 FALSE     
##  4  11       75   18.2 TRUE      
##  5  11.1     80   22.6 FALSE     
##  6  11.2     75   19.9 FALSE     
##  7  11.3     79   24.2 FALSE     
##  8  11.4     76   21   FALSE     
##  9  11.4     76   21.4 FALSE     
## 10  12       75   19.1 FALSE     
## # … with 15 more rows
{% endhighlight %}

Notice how the dimensions printed at the top of the tibble changed from 
`# A tibble: 31 x 4` to `# A tibble: 25 x 4` since we eliminated several rows.

Let's say you are interested in how the Height of a tree is related to whether
or not it is a small tree. In this case we only want to look at the columns
Height and Small_Tree, and you can **keep only these columns** using `select()`:


{% highlight r %}
trees %>% 
  mutate(Small_Tree = Volume < 19) %>% 
  filter(Height > 70) %>% 
  select(Height, Small_Tree)
{% endhighlight %}



{% highlight text %}
## # A tibble: 25 x 2
##    Height Small_Tree
##     <dbl> <lgl>     
##  1     72 TRUE      
##  2     81 TRUE      
##  3     83 FALSE     
##  4     75 TRUE      
##  5     80 FALSE     
##  6     75 FALSE     
##  7     79 FALSE     
##  8     76 FALSE     
##  9     76 FALSE     
## 10     75 FALSE     
## # … with 15 more rows
{% endhighlight %}

## Make Calculations on Grouped Variables

Now say you want to compare the Height of small trees and larger trees. You can
use the `group_by()` function to **specify groups within a column**. As you can
see it does not do much on its own:


{% highlight r %}
trees %>% 
  mutate(Small_Tree = Volume < 19) %>% 
  filter(Height > 70) %>% 
  select(Height, Small_Tree) %>% 
  group_by(Small_Tree)
{% endhighlight %}



{% highlight text %}
## # A tibble: 25 x 2
## # Groups:   Small_Tree [2]
##    Height Small_Tree
##     <dbl> <lgl>     
##  1     72 TRUE      
##  2     81 TRUE      
##  3     83 FALSE     
##  4     75 TRUE      
##  5     80 FALSE     
##  6     75 FALSE     
##  7     79 FALSE     
##  8     76 FALSE     
##  9     76 FALSE     
## 10     75 FALSE     
## # … with 15 more rows
{% endhighlight %}

To actually **make a grouped calculation** we need to use `summarize()`. In the
example below we are going to calculate the mean Height for each group, and
we will assign one value per group into a new column called Avg_Height. Finally,
use `ungroup()` once you are **finished with a grouped calculation**. You should
think about `group_by()` and `ungroup()` like open and closed parentheses. You
would not have one without the other.


{% highlight r %}
trees %>% 
  mutate(Small_Tree = Volume < 19) %>% 
  filter(Height > 70) %>% 
  select(Height, Small_Tree) %>% 
  group_by(Small_Tree) %>% 
  summarize(Avg_Height = mean(Height)) %>% 
  ungroup()
{% endhighlight %}



{% highlight text %}
## # A tibble: 2 x 2
##   Small_Tree Avg_Height
##   <lgl>           <dbl>
## 1 FALSE            78.7
## 2 TRUE             76
{% endhighlight %}

## Where to Go from Here?

This is just the snowflake at the tip of the iceberg of the Tidyverse. If you
are interested in learning more I highly recommend the 
[learning resources on the Tidyverse website](https://www.tidyverse.org/learn/).
