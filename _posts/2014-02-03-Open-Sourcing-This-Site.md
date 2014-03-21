---
layout: post
title: "Skaket - A Jekyll Blog Theme"
date: 2014-02-03 23:16:00
jumbo_title: Skaket
jumbo_subtitle: A Jekyll Blog Theme
---

On the eastern shore of Cape Cod near the town of Orleans there's a beach called Skaket. I love beaches in general, but Skaket is unique for two reasons. First, Skaket is one of the few beaches on the east coast of the United States where you can watch the sunset over the ocean. Second, when the tide goes out, it goes out for a mile or more. The shallow humps of the sandbars peek their way out the receding ocean, and you can wade your way through this slick archipelago.

Although the components of this site are pretty simple, I think it's worth sharing. So I'm introducing [Skaket](https://github.com/seankross/skaket) - A Jekyll blog theme. To get started with Skaket, you need to install Jekyll and then clone this repository:

```bash
~$ gem install jekyll
~$ git clone https://github.com/seankross/skaket.git
~$ cd skaket
~$ jekyll serve
# => Now browse to http://localhost:4000
```

Configuration is easy, just edit `_config.yml`:

```yaml
name: Sean Kross
pygments: true
base_url: /
markdown: redcarpet

github: seankross
twitter: seankross
```

The GitHub and Twitter icons will only appear in the right side of the footer if the `github` and `twitter` fields are set to a value other than `null`. Make sure to put your respective usernames in these fields.

At the beginning of each post there is some yaml front-matter which gives you some options:

```yaml
layout: post
title: Welcome to Jekyll!
date: 2014-02-03 23:16:00
jumbo_title: Welcome to Jekyll!
jumbo_subtitle: Static Websites from Plain Text
```

There's also a layout for notes, which are intended to be some mixture of a Gist, an email, and a blog post. The yaml front-matter for notes looks like this:

```yaml
layout: note
title: First Note
header: Consider the following
```

If you end up using Skaket, let me know! Also if you'd like to add features, pull requests are welcome!