---
layout: post
title: "End User Programming for Social Good"
date: 2019-07-22 18:55:00
jumbo_title: End User Programming for Social Good
jumbo_subtitle: ""
---

> Short version: [Philip Guo](https://twitter.com/pgbovine) and I wrote 
[a paper](https://seankross.com/vlhcc-2019/)
about how a team of 
data scientists built their own software tools for making, maintaining, and 
iterating on an educational program they designed to help adults from 
historically marginalized populations to start their data science careers.

The real story of this research project starts when I was sitting in the 
audience at [Shannon Ellis'](https://twitter.com/Shannon_E_Ellis/)
Design at Large [talk](https://youtu.be/P-mAGIE52yY). She was explaining
[Chromebook Data Science](https://jhudatascience.org/chromebookdatascience/) 
(CBDS), a
small miracle of a program that is offering *paid* educational opportunities to
adults in East Baltimore for training in data science. East Baltimore is a
historically marginalized neighborhood where the effects of 
[redlining](https://blogs.library.jhu.edu/2017/09/the-baltimore-redlining-map-ranking-neighborhoods/) can still be seen today. The goal of CBDS is to open up
educational and career pathways in a community where such opportunities, 
especially in technical fields, have been historically scarce. Currently they
find interested adult students in East Baltimore by working with local 
organizations like [HEBCAC](https://hebcac.org/), an organization that helps
East Baltimore residents to further their education or find jobs. Each student
gets a tutor, they are given a Chromebook, and over the course of twelve weeks
they learn how to use their Chromebook to do data science and cloud computing
based work. After the program the CBDS team help place their students into
local data science jobs.

I got inspired during Shannon's talk about this new program when I realized
that there were several stories
with research implications that were simultaneously unfolding as part of the
CBDS project. The central and most important story of course is the impact this program is having on the community it is serving, and the effect it will have
on the student's careers. The team building CBDS is in the process of iterating
on their program while looking at the longitudinal outcomes of their students to
evaluate the extent to which CBDS is effective. I am optimistic that they will
have initial results to report on soon.

However, there is another story here about how the CBDS team was able to create
their program is such a short amount of time (three months), how they are able
to keep the course up to date despite how quickly data science technologies
are changing, and how they were able to quickly adapt course materials based on
feedback from their students. The CBDS team was made up of mostly data
scientists who engage in *end user programming*, a genre of programming
focused on using programming to achieve a goal, rather than to build a software
system. As data scientists, the CBDS team had years of combined experience
using programming to answer questions about biological and health data. To
build CBDS the team repurposed the tools of data science (and the spirit of
end user programming) to affect social change and to explore new methods of 
producing an educational experience. 

To investigate how this happened we interviewed everyone on the CBDS team,
asking them about the work they did for the project, and how they collaborated
with each other. It turns out that they already had many of the tools and skills
they needed to build this program from their experiences and expertise that 
they had developed doing open and reproducible science. Almost all of the
course materials were written in R Markdown - the most popular computational
notebook for R programmers. R Markdown is a plain text format, therefore
the team could use collaboration and versioning tools like Git and GitHub.
Several members of the CBDS team routinely write academic papers, blogs, and
even interactive dashboards using R Markdown, so it was natural for them to
extend this format to creating courses.

To transform these R Markdown files into the artifacts the team needed for 
teaching a course the CBDS team partnered with [Leanpub](https://leanpub.com/),
an eBook publisher, to launch a new online course platform. This platform can
ingest modified Markdown files to create an online course structure with 
individual lessons and assessments. Data science is a rapidly changing field,
so keeping data science courses up to date is usually challenging. Online
course providers like Coursera only allow instructors to change the content of
their course through a web interface, so making lots of changes to course has
been historically difficult. This difficulty is especially frustrating in data 
science courses which can depend heavily on a few software libraries. If the 
API for one of those libraries changes, then updating the entire course can be
extremely tedious. However, since all of the course materials for CBDS are based
in plain text documents like R Markdown, updating materials to incorporate
changing technologies is significantly easier and closer to the workflows the
CBDS team uses in the rest of their work.

Videos and video lectures are a central component of many online courses, and
the CBDS team confronted many of the same challenges with video content as they
did with the rest of the materials in their course. Whenever the API for a 
software library would change, they would need to re-shoot and re-edit the
video, a process that consumed valuable time and resources. In order to keep
their videos up-to-date and decrease the amount of time required to produce each
video they developed [Ari](https://github.com/seankross/ari), a software 
library for R that allowed them to write
R Markdown documents that could be compiled into videos. To create a video
using Ari, a team member would create a series of lecture slides using R
Markdown. They would then write a script that would be read over each slide
using text-to-speech technology that Ari could access. Ari would then stitch
together the narration audio file and the series of slide images into a video.
Since the source material for all of the course videos were plain text files,
changes to videos could be tracked and videos could be created collaboratively
using Git, GitHub, and the rest of the CBDS team's typical workflow.

To manage and test all of these materials and digital artifacts that were being
created for the course, the CBDS team developed 
[Didactr](https://github.com/muschellij2/didactr), another R library that
tested and packaged all of their materials and videos. The CBDS team was 
accustomed to the data processing pipelines common in genomics and 
bioinformatics research, and Didactr served as a comparable piece of 
pipeline-like software for proofing and publishing their online courses.

The sum of this entire process suggests the emergence of new technologies for
maintaining educational materials which I have been thinking of as "EdDevOps"
or DevOps for education. Traditional DevOps (which is still a relatively
new field) combines software development practices with the operational and
deployment requirements that are necessary for running that software. EdDevOps
is similarly concerned with development, deployment, and maintenance, however
applied to educational materials and specifically materials that address
rapidly changing fields like data science. In the future instead of authors and
instructors needing to painstakingly revise course materials, this process
could be significantly aided by software that is empowered to update materials
automatically.

End user programming means using programming to achieve a specific goal, and in
the case of the CBDS team this goal was to affect social change in their local
community through creating new educational programs and career opportunities. 
CBDS is of course not the first effort towards social change driven by end user 
programming. [Data for Black Lives](http://d4bl.org/about.html) is one example
of how data sharing and analysis can be used to empower social change. The case
of CBDS is remarkable however because of how many tools and paradigms that were
already available to the CBDS team could be repurposed to meet their new 
socially focused goal. This case study opens up questions about who is in the
best position to create opportunities like CBDS, and how end user programming
can be an empowering force to this end.
