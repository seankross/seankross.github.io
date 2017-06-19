---
layout: post
title: "Turning Researcher Fatigue into Puppy Fatigue"
date: 2017-06-19 14:40:00
jumbo_title: Turning Researcher Fatigue into Puppy Fatigue
jumbo_subtitle:
---

On June 16th I gave the following short talk at Harvard's Institute for Quantitate
Social Sciences before I was on a panel with
[Victoria Stodden](https://twitter.com/victoriastodden),
[Thomas Leeper](https://twitter.com/thosjleeper),
and [Margo Seltzer](https://www.eecs.harvard.edu/margo/) as part of the 2017
Dataverse Community Meeting. The discussion centered around the "researcher
fatigue" that some experience when they're unwilling to use computational tools
for reproducible research. You can find the slides for this talk
[here](http://seankross.com/iqss-talk/). The source code for this blog post is
a little different than usual, if you're interested you can find it [here](https://github.com/seankross/seankross.github.io/blob/master/_Rmd/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue.Rmd).

---


<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/1.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>I was thinking about the topic for this panel, and I started imagining some
of the potential uses for a data repository like Dataverse beyond the features
it already offers.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/2.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>In the beginning of the reproducible research movement sharing data, code,
and other research artifacts was a hard problem.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/3.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Thankfully the right investments in infrastructure were made and now we have
resources like Dataverse!</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/4.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>However at the same time many other file storage services proliferated
making it easy to just throw files and code online without the well thought
out structure of an academic data repository.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/5.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>The &ldquo;throwing files online&rdquo; approach is currently the least fatiguing path!
My boss <a href="https://twitter.com/jtleek">Jeff Leek</a> (pictured here) just wrote a
<a href="https://simplystatistics.org/2017/06/13/the-future-of-education-is-plain-text/">blog post</a>
championing just posting plain text files online. If you just put your data
on your website then nobody has to log in to a platform, theoretically they
can have the data in their computing environment with a URL and one line of
code.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/6.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>My question is - what kind of value can a data repository provide beyond
being a place to make data available?</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/7.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Well thankfully we have the tools of open science available to us in a data
repository! We have ORCiD IDs, DOIs, and all of the metadata that
our datasets are labelled with. What if we used these resources to make a data
repository a destination for discovering new research, datasets, and potential
collaborations?</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/8.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Here&#39;s a screenshot from my recent front page of Amazon.com of books I might
be interested in. Clearly this is the result of a clustering algorithm, based
on the books I&#39;ve looked at or purchased in the past. These kinds of recommender
systems have become off-the-shelf technology in the last few years, and you
could imagine how incorporating a recommender system into a data repository
might help users discover research. We&#39;re collecting so much metadata about
the datasets going into these repositories, why not use that metadata in order
to suggest other datasets that a researcher might be interested in?</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/9.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>What if we thought about a data repository as a kind of meta-data product?</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/10.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>We&#39;ve recently been working on a project that&#39;s similar in spirit in the Johns
Hopkins Data Science Lab. We&#39;ve been working with Lucy and Nick, both PhD
students in the Biostatistics Department at Vanderbilt University.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/11.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>They&#39;ve developed a web application called Papr, which shows you abstracts
bioRxiv pre-prints. You can swipe left on an abstract if you don&#39;t like the
paper, or swipe right if you do like the paper.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/12.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Based on metadata for each pre-print we&#39;re able to construct a <em>paper-space</em>
where we can match you with researchers who have similar interests.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/13.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>My hope and my proposal is that we can take ideas from other technology
products to make reproducible research tools more user-focused, so that users
will making their research reproducible. Perhaps one day the idea of researcher
fatigue will seem as foreign as puppy fatigue!</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-06-19-Turning-Researcher-Fatigue-into-Puppy-Fatigue/14.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Thank you!</p>


</div>

</div>
