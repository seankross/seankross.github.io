---
layout: post
title: "Tidying and Comparing Binomial Data"
date: 2017-02-07 23:00:00
jumbo_title: Tidying and Comparing Binomial Data
jumbo_subtitle:
---

Lately I've been pressuring to myself to create very fancy blog posts, and 
although I enjoy writing in-depth posts I find that it can be limiting in terms
of what I allow myself to write. My general ethos is than one should just make 
something, even if it's just a small tip, and put it on the
web. Two folks who are fantastic at doing this are
[Lucy McGowan](https://twitter.com/LucyStats) and 
[Nick Strayer](https://twitter.com/NicholasStrayer)
who publish the [Live Free or Dichotomize](http://livefreeordichotomize.com/) 
blog together. I intended for my blog to be more of a public technical diary 
than a highly produced personal branding vehicle, so here it goes.

Recently I was asked to compare two datasets which contained binomial data
across the same variables. My colleague asked me to compare the proportion of
`TRUE` measurements between groups for each variable. After coming up with this
workflow I thought it might be something I could use again and it might be
useful to others too. The datasets I was dealing with were significantly larger
than the datasets in this post though they have the same structure.

I'm also consistently delighted to use `tidyr`, especially if I can use one of
the package's functions without looking at the help pages (Though they're well
written and you should certainly look at them often!) This is pretty simple
example of basic data tidying and modeling, but I'd like flesh out this process
by showing the resulting data frame after each step in this pipeline. First
let's set up the fake data which resembles the real data that lead me to this
procedure:


{% highlight r %}
library(dplyr)
library(tidyr)
library(purrr)

set.seed(2017-01-31)

# Setting up fake data
datasetA <- sample(c(TRUE, FALSE), 1000, replace = TRUE) %>%
  matrix(ncol = 10) %>%
  as_data_frame()
colnames(datasetA) <- paste0("variable", 0:9)

datasetB <- sample(c(TRUE, FALSE), 1000, replace = TRUE, prob = c(.4, .6)) %>%
  matrix(ncol = 10) %>%
  as_data_frame()
colnames(datasetB) <- paste0("variable", 0:9)

datasetA
{% endhighlight %}



{% highlight text %}
## # A tibble: 100 × 10
##    variable0 variable1 variable2 variable3 variable4 variable5 variable6
##        <lgl>     <lgl>     <lgl>     <lgl>     <lgl>     <lgl>     <lgl>
## 1      FALSE     FALSE      TRUE      TRUE     FALSE     FALSE      TRUE
## 2       TRUE      TRUE      TRUE     FALSE      TRUE     FALSE      TRUE
## 3       TRUE      TRUE      TRUE     FALSE     FALSE     FALSE     FALSE
## 4       TRUE      TRUE     FALSE      TRUE     FALSE      TRUE     FALSE
## 5       TRUE      TRUE     FALSE     FALSE      TRUE      TRUE     FALSE
## 6       TRUE     FALSE     FALSE     FALSE      TRUE      TRUE      TRUE
## 7      FALSE      TRUE     FALSE      TRUE      TRUE      TRUE     FALSE
## 8       TRUE      TRUE      TRUE     FALSE     FALSE      TRUE     FALSE
## 9      FALSE      TRUE      TRUE     FALSE     FALSE      TRUE     FALSE
## 10     FALSE     FALSE      TRUE      TRUE      TRUE     FALSE      TRUE
## # ... with 90 more rows, and 3 more variables: variable7 <lgl>,
## #   variable8 <lgl>, variable9 <lgl>
{% endhighlight %}

As you can see


{% highlight r %}
datasetA %>%
  map_df(sum)
{% endhighlight %}



{% highlight text %}
## # A tibble: 1 × 10
##   variable0 variable1 variable2 variable3 variable4 variable5 variable6
##       <int>     <int>     <int>     <int>     <int>     <int>     <int>
## 1        55        60        55        48        48        55        55
## # ... with 3 more variables: variable7 <int>, variable8 <int>,
## #   variable9 <int>
{% endhighlight %}


{% highlight r %}
datasetA %>%
  map_df(sum) %>%
  gather(variable, n_true)
{% endhighlight %}



{% highlight text %}
## # A tibble: 10 × 2
##     variable n_true
##        <chr>  <int>
## 1  variable0     55
## 2  variable1     60
## 3  variable2     55
## 4  variable3     48
## 5  variable4     48
## 6  variable5     55
## 7  variable6     55
## 8  variable7     58
## 9  variable8     56
## 10 variable9     41
{% endhighlight %}


{% highlight r %}
tbl_a <- datasetA %>%
  map_df(sum) %>%
  gather(variable, n_true) %>%
  mutate(set = "A")

tbl_a
{% endhighlight %}



{% highlight text %}
## # A tibble: 10 × 3
##     variable n_true   set
##        <chr>  <int> <chr>
## 1  variable0     55     A
## 2  variable1     60     A
## 3  variable2     55     A
## 4  variable3     48     A
## 5  variable4     48     A
## 6  variable5     55     A
## 7  variable6     55     A
## 8  variable7     58     A
## 9  variable8     56     A
## 10 variable9     41     A
{% endhighlight %}


{% highlight r %}
tbl_b <- datasetB %>%
  map_df(sum) %>%
  gather(variable, n_true) %>%
  mutate(set = "B")
{% endhighlight %}


{% highlight r %}
bind_rows(tbl_a, tbl_b) %>%
  spread(set, n_true)
{% endhighlight %}



{% highlight text %}
## # A tibble: 10 × 3
##     variable     A     B
## *      <chr> <int> <int>
## 1  variable0    55    46
## 2  variable1    60    41
## 3  variable2    55    45
## 4  variable3    48    36
## 5  variable4    48    43
## 6  variable5    55    38
## 7  variable6    55    37
## 8  variable7    58    37
## 9  variable8    56    34
## 10 variable9    41    32
{% endhighlight %}


{% highlight r %}
bind_rows(tbl_a, tbl_b) %>%
  spread(set, n_true) %>%
  mutate(models = map2(A, B, ~ prop.test(c(.x, .y), c(100, 100))))
{% endhighlight %}



{% highlight text %}
## # A tibble: 10 × 4
##     variable     A     B      models
##        <chr> <int> <int>      <list>
## 1  variable0    55    46 <S3: htest>
## 2  variable1    60    41 <S3: htest>
## 3  variable2    55    45 <S3: htest>
## 4  variable3    48    36 <S3: htest>
## 5  variable4    48    43 <S3: htest>
## 6  variable5    55    38 <S3: htest>
## 7  variable6    55    37 <S3: htest>
## 8  variable7    58    37 <S3: htest>
## 9  variable8    56    34 <S3: htest>
## 10 variable9    41    32 <S3: htest>
{% endhighlight %}


{% highlight r %}
prop_tbl <- bind_rows(tbl_a, tbl_b) %>%
  spread(set, n_true) %>%
  mutate(models = map2(A, B, ~ prop.test(c(.x, .y), c(100, 100)))) %>%
  mutate(p_value = map_dbl(.$models, ~ .$p.value)) %>%
  mutate(p_value = p.adjust(p_value, method = "bonferroni")) %>%
  mutate(signif = p_value < .05)

prop_tbl
{% endhighlight %}



{% highlight text %}
## # A tibble: 10 × 6
##     variable     A     B      models    p_value signif
##        <chr> <int> <int>      <list>      <dbl>  <lgl>
## 1  variable0    55    46 <S3: htest> 1.00000000  FALSE
## 2  variable1    60    41 <S3: htest> 0.10905521  FALSE
## 3  variable2    55    45 <S3: htest> 1.00000000  FALSE
## 4  variable3    48    36 <S3: htest> 1.00000000  FALSE
## 5  variable4    48    43 <S3: htest> 1.00000000  FALSE
## 6  variable5    55    38 <S3: htest> 0.23310570  FALSE
## 7  variable6    55    37 <S3: htest> 0.15869916  FALSE
## 8  variable7    58    37 <S3: htest> 0.04626229   TRUE
## 9  variable8    56    34 <S3: htest> 0.02837545   TRUE
## 10 variable9    41    32 <S3: htest> 1.00000000  FALSE
{% endhighlight %}
