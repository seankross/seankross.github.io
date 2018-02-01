---
layout: post
title: "The Difference Between Chi-Squared Tests"
date: 2017-12-18 17:00:00
jumbo_title: The Difference Between Chi-Squared Tests
jumbo_subtitle:
---

> "Expectations is the place you must always go to before you get to where you're going." - The Whether Man from Norton Juster's *The Phantom Tollbooth*

My first quarter at UC San Diego is coming to an end, and so far graduate
school been everything I hoped for ☺️. For the past few months I worked as 
a teaching assistant with [my advisor](http://pgbovine.net/) for a course
called Introduction to Human Computer Interaction. The course was originally
designed by [Scott Klemmer](https://twitter.com/designatlarge), and he
continues to teach and develop the course with Philip. If you're interested in
HCI in general it's a fantastic introduction and I encourage you to check out
the [course website](http://courses.pgbovine.net/cogs120-cse170/) for this 
past quarter, or if you want to take a deep dive you can sign up for Scott's 
specialization on 
[Coursera](https://www.coursera.org/specializations/interaction-design).

During the course groups of students built web applications for desktop and
mobile devices. I was responsible for a group of about thirty students and I am
so proud of their work! It's amazing what they were able to accomplish in just
ten weeks. In the last few weeks of the course they deployed their applications
which created context for the class to have a discussion about A/B testing.
We presented the Chi Squared test for comparing metrics between page variants,
like in the case of comparing how many times users clicked on a particular
button. Most of the students had a limitted statistical background, which meant
that I had the opportunity to talk to students about statistics - honestly one
of my favorite things to do!

Many of the students of course searched the internet for a better understanding
of the Chi Squared test before coming to me, but in many cases their web
browsing left them even more confused. One major point of confusion was the
fact that there are multiple types of Chi Squared tests, and it's difficult to
understand how to use each of the tests, and most importantly for them which
test is appropriate to use for A/B testing. After looking around at what's 
online I also feel dissatisfied by the explanations available, so I will try to
write my own here. The following are examples of three different Chi Squared
tests that I feel undergraduate students are mostly likely to encounter. There
are of course *other* Chi Squared tests, however they are usually reserved for
more "advanced" tasks, like comparing how different models fit the same data.

## Why use the Chi Squared test?

The Chi Squared test can tell us how well our observatins fit our expectations.
In each version of the Chi Squared test, a different question about this
relationship between observations and expectations is being asked, mostly based
on how we created the expectations that are being tested. The following Chi
Squared tests are best used with counts of categorical variables from an
observed sample. The general formula for calculating the Chi Squared statistic
is the following:

$$
\chi^2 = \frac{(Observed - Expected)^2}{Expected}
$$

The *Observed* variable is the counts of an event that we actaully measure,
while the *Expected* variable is the count that we expected. If we have
expectations about multiple related counts, then we can add up multiple Chi
Squared values to obtain a final value that we can use to evaluate the
relationship between the counts.

## The Test for Goodness-of-Fit

The first Chi Squared test we'll discuss, the test for goodness-of-fit, is a
tool for assessing whether a system produces counts that follow a
pre-determined set of proportions. For example, imagine you're in charge of
the factory that produces all of the M&Ms for the winter Olympics in
PyeongChang South Korea. As a promotion for the olympics, all of the M&Ms
produced need to be in one of four colors of the flag of South Korea: red,
white, blue, and black. You have instructions that these colors should be
produced in the following proportions: for every ten M&Ms, four should be
white, three should be blue, two should be red, and one should be black. You
program the manufacturing equipment to mix different colored M&Ms in that
ratio, but how can you be sure that the process is working?


In the Chi Squared Goodness-of-Fit test, there is a pre-determined ratio
between categories

Homogeneity
are two populations of categorical variables the same?
A/B test

Independence
categorical variables are related?

Goodness-of-fit
Bee gene distribution

http://www.stat.yale.edu/Courses/1997-98/101/chigf.htm

https://onlinecourses.science.psu.edu/stat414/node/311

https://onlinecourses.science.psu.edu/stat500/node/56

