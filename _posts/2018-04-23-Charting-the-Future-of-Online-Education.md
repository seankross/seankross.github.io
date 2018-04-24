---
layout: post
title: "Charting the Future of Online Education"
date: 2018-04-23 12:00:00
jumbo_title: Charting the Future of Online Education
jumbo_subtitle:
---

In September of last year, I left what had been a dream job working in the
[Johns Hopkins Data Science Lab](http://jhudatascience.org/) where I spent a 
significant amount of time developing a few much-loved online courses.
I left Baltimore and accepted an offer to become a PhD
student in [Philip Guo](https://twitter.com/pgbovine)'s lab at UC San Diego,
where I am further pursuing my interests in both creating more humane online
educational experiences and trying to develop a better understanding of how
scientists do data analysis in order to understand and communicate the results
of their own experiments.

Although I had significant experience creating online courses I only had a
surface-level understanding of the current state of the art in online education
research. In order to improve my understanding of current developments in the
field I set off to read every paper published at the
[Learning at Scale](https://learningatscale.acm.org) conference, a relatively
new venue for educational researchers and computer scientists to present the
latest innovations in the world of technology-enabled education. Philip
encouraged me to write and submit a meta-analysis type of paper to Learning at
Scale, reviewing all of the papers published at the conference so far. I'm happy
to announce that the paper was accepted and I will be presenting it at Learning
at Scale 2018 in London! You can read a pre-print of the paper 
[here](http://seankross.com/las-2018/kross-guo-las-2018.pdf), or you can read
the "manifesto" version of the paper below.

## MOOC Development is like Space Exploration

One of the central virtues of space exploration is that the depth of thought
and level of engineering sophistication required to allow humans to live and
work in space has pushed all of the fields involved 
[forward](https://en.wikipedia.org/wiki/NASA_spinoff_technologies). Like outer
space, the modern online classroom is also an extreme environment which requires
new strategies and technologies to address what happens when challenges
that have been solved in the classroom must be re-purposed for teaching large
groups of students online. These challenges present themselves most prominently
in Massive Open Online Courses (MOOCs) where unlimited numbers of students can 
enroll in classes that are often offered for free.

When you are teaching thousands of students from all over
the world, how do you do provide them with meaningful feedback for the 
assignments they complete for the class, let alone fair grades? If you're
teaching computational skills, how can you ensure that all of your students can
set up a computing environment that will allow them to achieve the goals of the
course? Broadly speaking, it appears that building technologies to help
students connect to each other as individuals, and connecting them to a larger community
of learning can help solve these problems. Aggregating lessons learned by
previous students, and using student feedback in order to anticipate a student's
error can help to steer students towards an understanding of material more 
efficiently than what might be able to be achieved in a regular classroom. 

Despite the fact that the [hype](https://www.nytimes.com/2012/11/04/education/edlife/massive-open-online-courses-are-multiplying-at-a-rapid-pace.html)
around MOOCs reached a fever pitch several years ago, we are finally
emerging from the [trough of disillusionment](https://www.gartner.com/technology/research/methodologies/hype-cycle.jsp)
around MOOCs. As a result, the tools that have been developed to
help assuage the growing pains experienced in MOOCs are finding applications
outside of MOOCs themselves. 

## What Does Scaled Education Really Mean?

Imagine the most intimate and nurturing educational experience you have ever had:
maybe an elementary school teacher who picked you as their favorite student, or
a college professor whose office hours you would attend religiously. Now imagine
if you had that level of personal attention for every course you were ever
enrolled in at every stage of your education. I believe this is the ideal we
should be striving for when we think about what
free, accessible, scaled education could become. Currently this dream is 
unrealistic because there aren't enough people with enough hours in the day who
know specifically how to help you learn. However, computers may be able to fill
in some of those gaps, and they might help teachers be more effective in
delivering ideas and knowledge.

Consider the miracle it is today that if you want to learn some skill, for 
example, how to do algebra, there are many thousands of tutorials, videos, 
books, and guides that are only a few clicks away from anybody with an internet
connection. Scaling the availability of information is easy online, however 
those learning materials know nothing about your prior knowledge or your goals
(unlike a nurturing mentor).

The spectrum between a caring mentor and a YouTube tutorial can be thought to
represent to two extremes in education: hard to deliver and very personal,
versus easy to deliver and very impersonal. Ideally "Learning at Scale" means
maximizing the best parts of these two paradigms by using technology to make
*personalized* learning experiences *easy* to deliver. Currently
these kinds of technologies take on many forms, including personal cognitive
tutors, educational recommendation systems, and platforms for facilitating
face-to-face interactions between students and instructors. In order to continue
creating more immersive experiences for students, we need to empower educators
with tools that can help them develop learning materials beyond watching
videos and assessments that are more pertinent than multiple choice questions.

Additionally, we need to build technology which is able to adapt to who our
students are: with sensitivity to both what their goals are, and how they want
their education delivered to them. Currently, if a student enrolls in an online
course and then doesn't complete the course they're measured as a "dropout."
This method for evaluating whether or not a course is successful is completely
antiquated. Students come to an online course with diverse goals: some of them
are looking for one piece of information contained in the course, others might
just be looking to refresh knowledge they learned in the past. We need to design
online learning environments that can serve all of these needs, and we need to
measure the efficacy with which we help students accomplish their differing
goals. There is also a disconnect in that most of these learning technologies
are being developed for desktop computing environments, despite the fact that
people around the world are spending an increasing amount of time on mobile
devices. The modes for interacting with a mobile device are much different
compared to how we interact with desktop computers, and currently it doesn't
appear that current research is capturing these interactions.

## The Cathedral, the Bazaar, and the Schoolhouse

In a traditional classroom, dozens of students put an immense amount of work
into their classes. They create artifacts in the forms of notes, flashcards,
and review guides. They comb through lecture notes and slide decks provided
by instructors
and annotate them according to what enclosed information they think is
most relevant to their success. Over a semester, they not only master the 
material in the course, but they master the skills required to take the course
itself. Unfortunately at the end of the course nearly all of these artifacts
and insights are discarded, or at best they're filed away for future, personal
reference. In college courses all of the emotions, opinions, and labors of
students outside of their assessments is submitted through a "course evaluation,"
a survey that many students don't have time to submit. These evaluations are
very low-fidelity, and they fail to provide a transparent process for how student
feedback influences future iterations of a course.
One major promise of
technologically enabled education is the potential for students to contribute
more of their work to the improvement of a course. This way students can use
materials that have been developed over time by other students, they can see
pathways to understanding that students in the past have taken, and they can
propose changes to a course if they believe they should be made. In my course
[The Unix Workbench](http://seankross.com/the-unix-workbench/), students are
actively encouraged to point out errors in materials and to contribute to the
course, however they are also taught highly technical skills for contributing
to open source software using Git and GitHub, and they use those skills in order
to contribute to the course. Expecting students in all kinds of disciplines to
to use such technical software is not practical, so we will need to develop
software that allows students to easily contribute new content to a course,
propose changes to existing content, and to understand their own path through
a course so that they can choose whether or not they want to share that path
with others.

## Thanks

Thank you to my advisor Philip Guo for your advice, encouragement, editing
prowess, and laudable LaTeX skills! Also thank you to the 
[UC San Diego Design Lab](https://designlab.ucsd.edu/) for all of your 
incredible pre-submission advice and feedback.
