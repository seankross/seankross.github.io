---
layout: post
title: "Teaching Shiny with Knitr and Webshot"
date: 2016-11-22 17:00:00
jumbo_title: Teaching Shiny with Knitr and Webshot
jumbo_subtitle:
---

While writing [Developing Data Products](https://leanpub.com/ddp) 
I concocted a little scheme for showing examples of 
[Shiny](http://shiny.rstudio.com/) applications in a 
[bookdown](https://github.com/rstudio/bookdown) book that I think
is interesting enough to share. This method should work with any Rmd file, not
just bookdown books. Shiny applications are usually composed of two R files which 
must be named `ui.R` and `server.R`. In order to teach students about the 
structure of both of these files I want to show the students the code for each
file, I want them to be able to see a screenshot of the app, and I want students
to be able to run the app using `shiny::runGitHub()`. The first workflow I had for
showing these apps was:

1. Make the `ui.R` and `server.R` files and save them in a folder.
2. Copy and paste the `ui.R` and `server.R` files into an R code chunk in the
Rmd file.
3. Start the Shiny app and take a screenshot of the app.
4. Insert the screenshot in to the Rmd file wih a markdown img tag (`![](app.png)`).

This workflow was time consuming and if I wanted to make any tweaks to the app
I had to copy and paste the new code into the Rmd file and take a new
screenshot. Ideally I wanted modifying the code in one place to trigger the code
to be updated in the Rmd file and a new screenshot to be automatically generated.

The first goal of getting code from an R file into a code chunk in an Rmd file
can be achieved with the `read_chunk()` function from knitr. With `read_chunk()`
you can specify a path to an R file to "inserted" into an Rmd file. Inside of the
R file you're targeting the code that you want to include in the code chunk
should have a comment above it with the syntax: `# ---- [chunk name] ----`. For
example here's the code from my simple `server.R` file which is in a directory
called `app`:


    # ---- server ----
    
    library(shiny)
    shinyServer(function(input, output) {
      
    })

You can then set up the Rmd file to include the code above like so:

    ```{r, cache=FALSE, echo=FALSE}
    knitr::read_chunk("app/server.R")
    ```

    ```{r server, eval=FALSE}
    ```

Notice that the chunk name in the comment at the top of `server.R` matches the
name of the chunk where code will be inserted.

Now that getting the code in the Rmd file is figured out let's move on to
inserting a screenshot. The `appshot()` function from the webshot package
programmatically takes a screenshot of a Shiny app providied the path to the
app. If we use this function with the `include_graphics()` function from knitr
then we can capture and insert the screenshot in one step like so:

    ```{r, echo=FALSE}
    library(webshot)
    appshot(app = "app/", file = "app.png", vheight = 300)
    knitr::include_graphics("app.png")
    ```

And voila, mission accomplished! By modifying just the source files, the code in
the Rmd file and the screenshot of the app will now be updated whenever you
`knit()` the Rmd file. If you want to play around with an example of this 
process in action I set up a
[GitHub repo](https://github.com/seankross/teaching-shiny) with a simple example. Thank
you to [Yihui Xie](https://twitter.com/xieyihui) for 
[knitr](https://github.com/yihui/knitr) and
[Winston Chang](https://twitter.com/winston_chang) for the
[webshot](https://github.com/wch/webshot) package and may all your programmatic
document dreams come true!

# Update (2016-11-25)

Thanks Yihui for this tip:

<blockquote class="twitter-tweet" data-conversation="none" data-cards="hidden" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/seankross">@seankross</a> Instead of read_chunk, an easier and more elegant way is <br>```{r server, code=readLines(&#39;app/server.R&#39;)} <a href="https://t.co/6lrmNPcW0u">https://t.co/6lrmNPcW0u</a></p>&mdash; Yihui Xie (@xieyihui) <a href="https://twitter.com/xieyihui/status/801492007080382464">November 23, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
