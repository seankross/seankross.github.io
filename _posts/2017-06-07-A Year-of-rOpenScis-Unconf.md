---
layout: post
title: "A Year of rOpenSci's Unconf"
date: 2017-06-07 11:50:00
jumbo_title: A Year of rOpenSci's Unconf
jumbo_subtitle:
---

What a year it's been.

I just attended [rOpenSci](https://ropensci.org/)'s [Unconference](http://unconf17.ropensci.org/)
in Los Angeles and it. was. incredible!

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Good morning LA! <br>Ready to kick off <a href="https://twitter.com/hashtag/runconf17?src=hash">#runconf17</a> <a href="https://t.co/dUOd69pFvK">pic.twitter.com/dUOd69pFvK</a></p>&mdash; Karthik Ram (@_inundata) <a href="https://twitter.com/_inundata/status/867752214600720384">May 25, 2017</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

The rOpenSci Unconf is an annual gathering of individuals who are interested in
and excited about using R to perform and promote open science. Some have
described it as a hackathon, but I think that's a mischaracterization. Though a
great deal of code is written in a short period of time, a substantial proportion
of the attendees make large and important contributions while hardly writing any
code. The Unconf is not a competition, and it's intensely social and collaborative.

My road to this year's Unconf started a year ago when I attended
[last year's Unconf](http://unconf16.ropensci.org/). Several folks created great
write-ups of that event including
[this one](https://juliasilge.com/blog/i-went-to-ropensci/) by
[Julia Silge](https://twitter.com/juliasilge) and
[this one](http://engineering.sharethrough.com/blog/2016/04/15/the-runconf16-ropensci-hackathon/) by
[Gabriela de Queiroz](https://twitter.com/gdequeiroz). By the spring of last
year I had been working at the [Johns Hopkins Data Science Lab](http://jhudatascience.org/)
for a few months. I was loving my work there but I felt isolated. Reading online
about how people cared about what we were working on in the lab did little for
my motivation, which was driven mostly by my personal belief in the importance
of open science and education.

Attending the 2016 Unconf drastically altered my professional and emotional
perspective on the R community and the larger open science movement. The event
made me feel like I was part of a growing global network of advocates for
open source computing and analysis. The
experience of spending two days hacking in a San Fransisco loft with 39 other
folks whose work you've admired for years was surreal and stimulating. Everyone
was so kind, helpful, and empathetic.

What's more is that this group of strangers, friends, and colleagues were able to
accomplish a ton in just a two-day span. You can take a look at everything we
worked on at the 2016 Unconf [here](http://seankross.com/notes/runconf16/).
Something that really impressed me was the wide range of the types of
contributions that were made possible by this environment. Even the folks who
you might consider the most "technically savvy" chose to work on creating guides and
documentation, which created space for those who weren't ready to dive into
package development so they could also make big contributions. The foundations and
relationships between attendees that started at the 2016 event have produced
some incredible work in the last year:

- [Julia Silge](https://twitter.com/juliasilge) and
[David Robinson](https://twitter.com/drob) created the
[tidytext](https://github.com/juliasilge/tidytext) package which resulted in a
[book](http://tidytextmining.com/) called *Text Mining with R: A Tidy Approach* that will soon be
[available from O'Reilly](https://www.amazon.com/Text-Mining-R-Tidy-Approach/dp/1491981652/),

- [Brooke Anderson](https://twitter.com/gbwanderson),
[Roger Peng](https://twitter.com/rdpeng),
and I wrote [*Mastering Software Development in R*](https://bookdown.org/rdpeng/RProgDA/)
which is available [here](https://leanpub.com/msdr).

- [Julia Steward Lowndes](https://twitter.com/juliesquid) started seriously using
[R Markdown](http://rmarkdown.rstudio.com/) at last year's event, and she just
published [a Nature paper](https://www.nature.com/articles/s41559-017-0160)
written in R Markdown!

And that's just's just scratching the surface! Considering how fun and
productive last year's event was, I was very excited for this year's Unconf.
There was plenty of build-up to the event including in-depth discussion about
what we wanted to work on facilitated via [GitHub Issues](https://github.com/ropensci/unconf17/issues).
I even created a [Shiny app](https://gist.github.com/seankross/d7cf98cf34f8a4f45394aba7975bfda2)
to help participants browse through nearly 100 proposed projects!

Despite hyping myself up for this event much more than I should have, the Unconf
yet again blew my expectations away! Just look at the badges they gave us!

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Best name tag ever? Yes. Yes it is. <a href="https://twitter.com/hashtag/runconf17?src=hash">#runconf17</a> <a href="https://t.co/2kXbWTCVBR">pic.twitter.com/2kXbWTCVBR</a></p>&mdash; Jennifer Thompson (@jent103) <a href="https://twitter.com/jent103/status/867946758021586944">May 26, 2017</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

We started off with [Stefanie Butland](https://twitter.com/StefanieButland),
rOpenSci's Community Manager, leading us in some ice breakers that actually
managed to break ice! Take a look at the response when we were asked about
impostor syndrome:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">*50+ of the best R programmers in the world* &#39;raise your hand if you have impostor syndrome!&#39; <a href="https://twitter.com/hashtag/runconf17?src=hash">#runconf17</a> <a href="https://t.co/aiRgHbVCtU">pic.twitter.com/aiRgHbVCtU</a></p>&mdash; Oliver Keyes (@kopshtik) <a href="https://twitter.com/kopshtik/status/867786243911819264">May 25, 2017</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

After getting to know each other a little better in the morning we got straight
to work, and in just two days we started (and a few people finished) tons of
[amazing projects](https://ropenscilabs.github.io/runconf17-projects/)! Here's
a sampling below:

### [A Minecraft Interface for R](https://github.com/ROpenSciLabs/miner)

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">The <a href="https://twitter.com/hashtag/rstats?src=hash">#rstats</a> logo in <a href="https://twitter.com/hashtag/minecraft?src=hash">#minecraft</a>. <a href="https://twitter.com/hashtag/runconf17?src=hash">#runconf17</a> <a href="https://t.co/wGidmaQKc1">pic.twitter.com/wGidmaQKc1</a></p>&mdash; Karl Broman (@kwbroman) <a href="https://twitter.com/kwbroman/status/867993553946910721">May 26, 2017</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

### [Creating Websites from EML Data](https://github.com/ropenscilabs/emldown)

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Team emldown! <a href="https://twitter.com/ma_salmon">@ma_salmon</a>, <a href="https://twitter.com/cboettig">@cboettig</a>, and <a href="https://twitter.com/polesasunder">@polesasunder</a>. <a href="https://twitter.com/hashtag/runconf17?src=hash">#runconf17</a> <a href="https://t.co/mNYQoThMJx">pic.twitter.com/mNYQoThMJx</a></p>&mdash; Kara Woo (@kara_woo) <a href="https://twitter.com/kara_woo/status/868557797528543232">May 27, 2017</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

### [Sending Templated Emails from R](https://github.com/ropenscilabs/ponyexpress)

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I’m using the ponyexpress glitter template for all my emails from now on, thanks <a href="https://twitter.com/LucyStats">@LucyStats</a> and <a href="https://twitter.com/_inundata">@_inundata</a>. <a href="https://twitter.com/hashtag/runconf17?src=hash">#runconf17</a> <a href="https://t.co/wW1kuKeiKa">pic.twitter.com/wW1kuKeiKa</a></p>&mdash; Kara Woo (@kara_woo) <a href="https://twitter.com/kara_woo/status/868279771246936064">May 27, 2017</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>

And that's just a small sample of the many of
[all of the projects](https://ropenscilabs.github.io/runconf17-projects/) which
you should check out! (There's probably something in there that you could use!)

What makes this conference truly special is the people who attend. I don't know
how rOpenSci is able to curate such a consistently friendly, empathetic,
passionate, and interesting group of people but somehow they pull it off year
after year. The participants come from a wide range of disciplines and backgrounds
including [banking / data science](https://twitter.com/jasdumas),
[visualization / ballet](https://twitter.com/kara_woo),
[indigenous rights / cybersecurity](https://twitter.com/kopshtik),
and [nights at the museum](https://twitter.com/alice_data)! You can find all
of the attendees on [this Twitter list](https://twitter.com/seankross/lists/ropensci-unconf-2017).
Considering this
variety of interests in the rOpenSci community, I believe there are a few core
principles that unite us including:

1. Empathy for all who do research programming.
2. A commitment to openness.
3. Aspirations for diversifying the scientific community.
4. Embedding our values in software, documents, and processes.
5. Spreading this philosophy as far and wide as possible.

If you feel like you might identify with this community you should absolutely
apply next year! If you're afraid you might feel like an impostor at this event
don't worry - the vast majority of participants feel that way! (See relevant
tweet above.) If you're still unsure if the conference is right for you feel
free to get in touch with [me](https://twitter.com/seankross),
[Stefanie Butland](https://twitter.com/StefanieButland),
or [Karthik Ram](https://twitter.com/_inundata) (rOpenSci's Co-founder).
The rOpenSci Unconference catalyzes this beautiful community of open scientists
who share both technical and structural pain, and a hope for a more humane and
transparent future for scientific computing. Thank you to the entire rOpenSci
team for organizing this fantastic event! I can't wait to see what we all make
in the year to come!

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Thank you all you wonderful people who participated in <a href="https://twitter.com/hashtag/runconf17?src=hash">#runconf17</a> ! <a href="https://t.co/8fxEhC5zDG">pic.twitter.com/8fxEhC5zDG</a></p>&mdash; rOpenSci (@rOpenSci) <a href="https://twitter.com/rOpenSci/status/868539206842187776">May 27, 2017</a></blockquote>
<script async src="http://platform.twitter.com/widgets.js" charset="utf-8"></script>
