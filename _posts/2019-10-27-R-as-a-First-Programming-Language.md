---
layout: post
title: "R as a First Programming Language"
date: 2019-10-27 18:00:00
jumbo_title: R as a First Programming Language
jumbo_subtitle: "It's not as weird as you think!"
---

On the latest episode of 
[Not So Standard Deviations](https://youtu.be/idGTyYvQPnQ?t=2874),
[Roger Peng](https://twitter.com/rdpeng) brought up the
idea of teaching R as somebody's first programming language, a topic that Roger 
and I used to casually discuss. I want to clarify my take on those 
conversations, which to this day inform my thinking about understanding how 
people learn data science.

Introduction to coding or programming courses in high school and college usually
focus on one of three programming language environments: Java, Python, or 
HTML + CSS + Javascript. No matter which of these environments is being taught,
introductory instruction tends to focus on core programming language features
like the syntax of the language, types and variables, if/else statements,
loops, basic data structures, writing functions, and maybe some ideas about object oriented 
programming. There is also usually some mention about how memory is modeled
including a discussion about references, deep versus shallow copies, and stacks,
heaps, or frames. 

In contrast, many introduction to R classes never mention loops, if statements,
R's memory model, writing functions, or R's many systems for object oriented programming. 
As [Hilary Parker](https://twitter.com/hspter) said in the podcast, 
[research](https://seankross.com/2019/01/08/The-Front-Lines-of-Teaching-Data-Science.html) 
shows that somebody learning R
as their first programming language is "not as weird as you think!" Introduction
to R courses instead tend to emphasize the 
[data science lifecycle](https://r4ds.had.co.nz/introduction.html#what-you-will-learn),
which means focusing on teaching students how to use software libraries that are
not part of R's core features to manipulate tables, create visualizations, and
build statistical models. 

I have never seen an introduction to R course that is structured like an 
introduction to Java or Python course, though if one did exist, I imagine
it would borrow heavily from Hadley Wickham's book [*Advanced R*](https://adv-r.hadley.nz/).
The very existence of that book shows how in the R community topics like environments,
namespaces, and object oriented programming are considered advanced topics.
Compare this to the Python world where learning the core language features are
introductory material, and then learning about how to manipulate, model, and
visualize data are all subsequent advanced topics.

If I recall correctly, the reason that Roger and I were having these 
conversations about what an "Introductory R" course even means is because we
were interested in creating more online courses about R. Eventually
we teamed up with [Brooke Anderson](https://twitter.com/gbwanderson) to build a
[series of courses](https://www.coursera.org/specializations/r) and to write
a [book](https://leanpub.com/msdr) both called *Mastering Software Development in R*.

Finally, I want to talk about something Roger said towards the end of the 
conversation: "There has to be a moment where you really use [a programming 
language] in a production type setting." This got me thinking about the 
difference between learning your first ever programming language, which teaches
you how to think about code, and learning the first programming language that
you will use to maintain or create production systems, which will directly
impact your career. An undergraduate student taking an introduction to 
programming class does not expect to apply their programming knowledge in a 
production setting for at least several months. Perhaps they might get a
summer internship, but 
typically it can be a few years before they are writing code for production
systems. Compare their situation to a graduate student who is taking an 
"Introduction to R" course. In my own graduate school experience I know
students who are expected to apply their new programming skills to 
research projects immediately after or during an introductory course. This
difference in when a student is expected to apply their knowledge has certainly
influenced what is considered "introductory" for R versus other languages. Those
of us who teach data science should think more deeply about this difference in
expectations and how it effects expository programming instruction for researchers.
