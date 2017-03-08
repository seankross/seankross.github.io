---
layout: post
title: "Send a Text from R with Twilio"
date: 2017-03-07 23:00:00
jumbo_title: Send a Text from R with Twilio
jumbo_subtitle: We traced the call. It's coming from inside the script!
---

[Twilio](https://www.twilio.com/) is a tech company that has created a set of
incredible tools for connecting computer programs to telephony. Their company
provides a wide range of APIs for making phone and video calls, programmatically
setting up phone trees, buying phone numbers, and sending and receieving text
messages. Several of my collegues in the
[Johns Hopkins Data Science Lab](http://jhudatascience.org/) have
expressed interest in using text messaging as a way to collect data or as a
simple communication tool that could be integrated with a Shiny app.

When you sign up for Twilio you'll get a free trial account which allows you
to send and receive SMS and MMS messages from a phone number that is assigned to
you. Check out Twilio's guide for registering for a trial account [here](https://support.twilio.com/hc/en-us/articles/223136107-How-does-Twilio-s-Free-Trial-work-). You can only send messages between the phone number they assign you and
your personal cell phone, but it's enough to get your feet wet using their API.
After your trial has been exhausted it costs $0.0075 per message sent or
received.

Afer logging into Twilio's website for the first time you'll need to get three
pieces of information in order to use this R package: the phone number Twilio
has assigned to you, your account SID, and your account token. With that
information in hand you can get to work!

First install the package of course:


{% highlight r %}
install.packages("twilio")
{% endhighlight %}

Then load the package and you can quickly start firing off messages:


{% highlight r %}
library(twilio)

# First you need to set up your accound SID and token as environmental variables
Sys.setenv(TWILIO_SID = "M9W4Ozq8BFX94w5St5hikg7UV0lPpH8e56")
Sys.setenv(TWILIO_TOKEN = "483H9lE05V0Jr362eq1814Li2N1I424t")

# Then we're just going to store the numbers in some variables
my_phone_number <- "2125557634"
twilios_phone_number <- "9178675903"

# Now we can send away!
tw_send_message(from = twilios_phone_number, to = my_phone_number, 
                body = "Hello from R 👋")
{% endhighlight %}

```
## From: +19178675903
## To: +12125557634
## Body: Sent from your Twilio trial account - Hello from R 👋
## Status: queued
```


{% highlight r %}
# Send a picture message
tw_send_message(twilios_phone_number, my_phone_number, 
                "Do you like the new logo?",
                media_url = "https://www.r-project.org/logo/Rlogo.png")
{% endhighlight %}

```
## From: +19178675903
## To: +12125557634
## Body: Sent from your Twilio trial account - Do you like the new logo?
## Status: queued
```

Each call to `tw_send_message()` returns a simple `twilio_message` object with
basic information about the sent message.

You can also retrieve a log of the messages sent and received from your account
using `tw_get_messages_list()` which can be turned into a tidy data frame by
passing the result to `tw_message_tbl()`:


{% highlight r %}
library(magrittr)

tw_get_messages_list() %>%
  tw_message_tbl()
{% endhighlight %}

```
# A tibble: 2 × 16
                                 sid        date_created        date_updated
                               <chr>              <dttm>              <dttm>
1 SM1jtHMmhOCv90MA3XZiMinXbSY94EPVca 2017-03-07 22:53:47 2017-03-07 22:53:59
2 MMH82TU6tVCbGsspcDnvJU47JuTizM3DdE 2017-03-07 22:55:05 2017-03-07 22:55:11
# ... with 13 more variables: date_sent <dttm>, to <chr>, from <chr>, body <chr>,
#   status <chr>, num_segments <chr>, num_media <chr>, direction <chr>,
#   api_version <chr>, price <chr>, price_unit <chr>, error_code <lgl>,
#   error_message <lgl>
```

As you can see each text message gets its own sid after it has been sent or
received. If a text message has pictures or videos attatched to it you can pass
the sid to `tw_get_message_media()` in order to extract the URL where Twilio has
stored that picture or video.

## Bonus: Testing on Travis with API Keys

Testing this package seemed challenging at first because in order to test
whether or not these functions are correctly hitting the Twilio API I need to
use my own API keys. This isn't a problem when testing the package on my
computer however I like to use [Travis](https://travis-ci.org/) in order to
run continuous integration tests on my packages across multiple versions of R.
The problem then is that in order to use Travis I would have to commit my API
keys to Git, which would mean they would be published on GitHub, which is of course
[unacceptable](https://twitter.com/seankross/status/810223395656892416).

But thank the heavens above for [Jenny Bryan](https://twitter.com/jennybryan/)
who not only ran into every imaginable implementation problem while building
her spectacular [googlesheets](https://github.com/jennybc/googlesheets) package,
but then documented how she overcame every obstacle she faced. From reading her
[documentation](https://github.com/jennybc/googlesheets/blob/master/vignettes/managing-auth-tokens.Rmd)
I learned a strategy for encrypting environmental variables on Travis. Let's say
you want to use the API key `"MySecretKey"` for a package you're testing on
Travis, but you don't want to commit your key to Git since the key must be kept
secret. To encrypt your API key you should first install the `travis` tool for
the command line (make sure you have `ruby` installed first):


{% highlight bash %}
gem install travis
{% endhighlight %}

Now you can encrypt your API key and add it to your `travis.yml` in one step
(make sure your working directory is in the directory where your `travis.yml`
file resides):


{% highlight bash %}
travis encrypt API_KEY=MySecretKey --add
{% endhighlight %}

If you take a peak inside your `travis.yml` you should see a new line like this:

```
env:
  global:
  - secure: ZTV3ruzOfQiXxZYsevIn5nLR2QHkWS5lK22QKDaWWHAdgwUMJx0Qp4uD4WkFJumaUwaV46rrVLwnOVZSZ0HqNyyayGTcjdkWENnZvbUDcwSamLqzR5nD7vf3hfO32MvjDHia9UiDz6a5ilYFGJYzf2VwqJ8mGw8yRmBacQuWnWKibubMspK5TRqHgqhNgLN1tKlbfj6boHS14kr6PXWxU9LUpCJNaJtlHLBu5ZaTJWLXiKsWsGGom6vC0zvBfIGNm3nrjWgu4vlTpWGtmYxSiYCSa5pkEu9da1F5L8u00rznWLFqUZpPA4A5Bmsvz1cQmeE4JMcwb6nlFTwMK6xdRoyGkYIqvyyZAMMp6EHJQ0E2Ev1DdvEh8LJkGGGOAdAv43nnnrTzjV2Ba6qICzwTJb8IEPKZDpKQuIzlacWvtLcLYbXxH9znHOM5FYvthrCQMyCK622ZZajgG0oYlDhpm4o901UT75Fu7QytSaeGIvJFRkIJOoSDHXDwnqGf5cSuzFGJBrKbGFaAHrNAHj3TDXAKAiRjQlD8f802lcHJplZ1vtlsVPcylzA8fQ7oYkw6G2GLT3JKBl9MVOxNeQXX8dEd4IMV2AQzomNQzbhrDeNmQW7fIMYANEcrd6Fj407NH20Kt9bt4PYHBf81csmPsvGRCcPtMkBKyGuCd18OOOf=
```

Now simply run `Sys.getenv("API_KEY")` from within R (for example as part of a
test) and the unencrypted string will be returned! Seemingly you can add as
many encrypted evironmental variables as you desire.

I also want to thank Hadley Wickham, I would have not been able to make this 
package without his
[Best Practices for Writing an API Package](https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html)
vignette for `httr`. If you want to wrap an API with an R package it's the best
place to start!
