---
layout: post
title: "The Front Lines of Teaching Data Science"
date: 2019-01-08 16:10:00
jumbo_title: The Front Lines of Teaching Data Science
jumbo_subtitle: ""
---

> Short version: [Philip Guo](https://twitter.com/pgbovine) and I wrote 
[a paper](https://seankross.com/chi-2019/) about challenges facing data 
science instructors for the 2019 CHI conference. The paper won a
[Best Paper Honorable Mention](https://chi2019.acm.org/2019/03/15/chi-2019-best-papers-honourable-mentions/)
award (top 5% of papers).

Last year I had the privilege of talking to twenty data scientists who also
teach their craft in a variety of settings: big and small courses, online
and in person, and in academia and industry. They graciously told me
about how they approach the challenge of teaching such a broad and 
rapidly-changing field. Data science now encompasses an overwhelming number of 
technologies and techniques including modeling, visualization, data wrangling, 
storytelling, version control, and system administration.
How can they possibly keep a handle on everything? For all of the juicy details
see the paper linked above. Below are the key points from our investigation:

- Data scientists are often characterized as "end user programmers," meaning
they see programming as a means to an end (ends like answering scientific
questions) rather than a pursuit that is inherently interesting. We found that
instructors teach skills beyond end user programming, including how to integrate
data analysis code into mature technology stacks so that their software is more 
modular and reusable.
- One major framework in data science education is teaching an entire workflow,
as opposed to teaching any individual library or method. Instructors want their
students to know how to properly collect data, how to import and
manipulate data in their computing environment, and how to make sense of data. These
workflows are frequently developed in the open (online using open source
technologies). Since these instructors are also practitioners in their fields,
they often use and are able to influence the development of these workflows.
- Students in data science classrooms have widely varying backgrounds, and data
science is often their first introduction to programming. Instructors must
balance the amount of necessary technical details in their courses with teaching
the data analysis skills that students demand. Commonly students are motivated
to enroll in a course to learn one specific tool. Instructors appreciate this
source of student motivation, however instructors are also challenged to show
how an entire workflow is relevant where that motivating tool is only
one component.
- Data science workflows are often focused on transforming raw data into a
"rectangle," often a [tidy data frame](http://vita.had.co.nz/papers/tidy-data.html).
Most of the programming tasks involve building a pipeline to transform and
summarize these rectangles. Compared to computer science courses, there is less
emphasis on writing functions or managing data structures like trees or hash
tables. Data science instructors emphasize using existing APIs and weaving them
together over teaching how solutions to canonical problems are implemented.
- Instructors make sure that their data science students are well versed in
presenting analytically results and in writing essays that explain their reasoning
and conclusions. Computational notebooks like R Markdown and Jupyter are often
used for weaving together code, data, visualizations, and prose.
- It is often a challenge for instructors to make the appropriate
technology for doing data science available to students. We identified three 
different approaches that instructors used for setting students up with a data
science computing environment:
    1. *Desktop*: Each student configures their computing environment on their
    own computer. This requires the most technical support from the instructor,
    however it is valuable for students because many data scientists are 
    expected to know how to set up their own computing environments.
    2. *Server*: Students access a computing environment through a web browser
    that is maintained by teaching staff. Therefore students have a uniform 
    environment that requires no configuration on their part. This expedites 
    teaching core analytic concepts, however students miss out on learning how
    to configure their own environment.
    3. *Web application*: Instructors create a course in a specialized markup
    language which they then upload to a web application that simulates a
    computing environment for students. These environments are very convenient
    since they require no student or instructor setup or maintenance. However 
    despite instructors' best efforts, this medium makes lessons easy to
    complete [without actually learning any of the material](https://youtu.be/P-mAGIE52yY?t=1610).
- Preparing a data science course is aggravated by how difficult it is to find
relevant, domain-specific datasets. Data that students will have access to in
their professions (the kind of data that should be used for teaching) is often 
too sensitive or private to use in a classroom, so
instructors vigilantly look for data. When instructors discover data it often
takes them a significant amount of time to familiarize themselves with the data,
and even then the data are often too specific for teaching generalizable
concepts.
- Instructors face a huge amount of uncertainty and they teach their students
how to cope with uncertainty. Instructors actively normalize the experience of
"not knowing everything" by showing students how to search online for the
answers to student questions. They also teach the meta-skill of keeping one's
data science skills up to date, since data science technologies are
constantly evolving.

The purpose of this investigation is to highlight these
challenges for the human-computer interaction community, as a call to action to
study the quickly growing field of data science education. It is my
belief that in the near future data analytic programming  will become the
most common and in-demand form of programming. Since data
science is becoming integrated into many other fields, it is imperative that 
we pay attention to the needs of this community so that we can expand learning
opportunities and systematize best practices for data science educators.
