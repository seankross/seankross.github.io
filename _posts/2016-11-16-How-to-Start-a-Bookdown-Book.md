---
layout: post
title: "How to Start a Bookdown Book"
date: 2016-11-17 10:00:00
jumbo_title: How to Start a Bookdown Book
jumbo_subtitle:
---


I'm currently working on three different books: 
[Mastering Software Development in R](https://leanpub.com/msdr),
[Developing Data Products](https://leanpub.com/ddp), and
[The Unix Workbench](http://seankross.com/the-unix-workbench/). My increased
level of productivity has been 
[made possible in part](https://youtu.be/j3RpwtkSg1M) by 
[bookdown](https://bookdown.org/home/about.html),
an R package by the incredible and prolific
[Yihui Xie](https://twitter.com/xieyihui) which transforms R Markdown documents 
into a book that looks beautiful online with EPUB and PDF versions included. 

Getting started with bookdown is not yet a totally straightforward process so I
thought I would share what I do when I start a bookdown book. First open up 
your favorite R console and install bookdown if you haven't already:


{% highlight r %}
install.packages("bookdown")
{% endhighlight %}

I created a GitHub repository which contains what I consider to be the absolute
smallest amount of [boilerplate](https://en.wikipedia.org/wiki/Boilerplate_code)
code required to start a bookdown book which you can find
[here](https://github.com/seankross/bookdown-start). To get started you should
either fork and clone the repository or download it as a zip. There are three
configuration files you need to worry about in the repo, so let's take a look
at each of them starting with `_output.yml`:

```
bookdown::gitbook:
  css: style.css
  split_by: chapter
  config:
    toc:
      collapse: subsection
      before: |
        <li><a href="./">A Minimal Bookdown Book</a></li>
      after: |
        <li><a href="https://github.com/rstudio/bookdown" target="blank">Published with bookdown</a></li>
bookdown::pdf_book:
  includes:
    in_header: preamble.tex
  latex_engine: xelatex
  citation_package: natbib
bookdown::epub_book:
  stylesheet: style.css
```

The only line you should change here is the title of the book, which in this
case is `A Minimal Bookdown Book`. Moving on to `_bookdown.yml`:

```
book_filename: "bookdown-start"
chapter_name: "Chapter "
repo: https://github.com/seankross/bookdown-start
output_dir: docs
rmd_files: ["index.Rmd", "01-Introduction.Rmd", "02-Diving-In.Rmd"]
clean: [packages.bib, bookdown.bbl]
new_session: yes
```

The `book_filename` field determines what the name of the PDF and EPUB versions
of your book will be called. In the case of this book the PDF version would be
`bookdown-start.pdf`. The `chapter_name` field is a string that is appended to
the front of each chapter heading, followed by the chapter number. Chapter
headings are designated by H1 tags in R Markdown which are usually created
with a single pound sign (`#`). So for example in the file `01-Introduction.Rmd`
the first H1 tag is `# Introduction` which becomes 
"[Chapter 1 Introduction](http://seankross.com/bookdown-start/introduction.html)"
when the book is rendered. The `repo` field just designates a GitHub repository
associated with this book but this is not a required field.

The `output_dir`
field determines the directory where the HTML files for your book will be
rendered. If you don't set this field your book will be rendered in a
directory called `_book/`, however if you're going to be sharing your book with
GitHub Pages I highly recommend specifying the `docs` directory for 
`output_dir`. GitHub Pages has a
[new feature](https://github.com/blog/2228-simpler-github-pages-publishing)
which allows you to use a `docs/` folder in the master branch of your repo to
publish a static website. This allows you to track the source files for your
book and the published HTML files in the same branch, eliminating the need for
that pesky `gh-pages` branch. 

The `rmd_files` field is optional. If it is not specified then all Rmd files at
the root of your book directory are rendered as chapters in your book.
Alternatively you can list the files you want to be rendered like I have in
`_bookdown.yml`. The `new_session` field is also optional. If you specify
`new_session: yes` then each Rmd file is rendered in its own R session, 
otherwise all Rmd files in your book are rednered in the same R session.

The next bit of configuration you should consider is in the `index.Rmd` file.
This file serves as the cover and first few pages of your book, so authors
usually put the Preface and/or the Introduction in this file. At the top of this
file is a slice of yaml frontmatter that looks like this:

```
---
title: "A Minimal Bookdown Book"
author: "Sean Kross"
date: "2016-12-02"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib]
biblio-style: apalike
link-citations: yes
github-repo: seankross/bookdown-start
url: 'http\://seankross.com/bookdown-start/'
description: "Everything you need (and nothing more) to start a bookdown book."
---
```

You should change the `title`, `author`, `date`, `github-repo`, `url`, and 
`description` fields to customize your book. I omitted a field called
`cover-image` where you can specify the path to a image file for the cover of 
your book (I know `.png` works for sure).

Once you have those three configuration flies set up writing a bookdown book
couldn't be easier if you're familiar with R Markdown. Just write Rmd files
in the root directory of your book (where `index.Rmd` is) and run
`bookdown::render_book("index.Rmd")` periodically to compile your book. You can
preview the book by opening up the `index.html` file in the directory where your
book is rendered (`docs/index.html` in the case of `bookdown-start`). It's also
good practice to name your Rmd files so that they're ordered, which you can see
I've done with the prefixes of `01-`, `02-`, etc. You can then publish the book
on GitHub Pages or you can upload the book to [bookdown.org](https://bookdown.org/)
with the `publish_book()` function.

## Adding Travis

You can use [Travis CI](https://travis-ci.org/) to set up continuous
integration for your book. If you're unfamilar with continuous integration you
should read this short
[chapter](https://bookdown.org/rdpeng/RProgDA/continuous-integration.html) on
the subject. To use Travis for your book you need to include three files to the
root of your book's GitHub repo. You can copy the first two of these files
without modifying them:

Create a file called `.Rbuildignore` and copy, paste, and save the following:

```
^.*\.Rproj$
^\.Rproj\.user$
^\.travis\.yml$
```

Name this file `.travis.yml`:

```
language: r
cache: packages

script:
  - Rscript -e 'bookdown::render_book("index.rmd")'
```

Here's a starter `DESCRIPTION` file but you may need to modify it:

```
Package: placeholder
Title: Does not matter.
Version: 0.0.1
Imports: bookdown
Remotes: rstudio/bookdown
```

Specifically you should add R packages to the `Imports` or `Remotes` fields if
the R code in your book relies in certain packages. For more information about
`DESCRIPTION` files see [this](https://bookdown.org/rdpeng/RProgDA/r-packages.html#description-file)
short book section.

Make sure to enable continuous integration for your book's GitHub repo on
Travis, then add, commit, and push these files. Check the build after a few 
minutes to confirm that you have CI set up for your book.

## Conclusion

Most of this post has been cobbled together from public GitHub repositories I
found on [bookdown.org](https://bookdown.org/) combined with a few hours of 
playing with and tweaking bookdown. My
[bookdown-start](https://github.com/seankross/bookdown-start)
repo is just a pared down version of Yihui's
[bookdown-demo](https://github.com/rstudio/bookdown-demo) repo. I use the
workflow described above whenever I start a book and if you have any
improvements, suggestions, or cool hacks I'm interested in hearing about them.
For a complete and robust treatment of using bookdown you should read
Yihui's book: 
[Authoring Books and Technical Documents with R Markdown](https://bookdown.org/yihui/bookdown/). Thanks again to Yihui for
creating this awesome package and for providing feedback for this post.

