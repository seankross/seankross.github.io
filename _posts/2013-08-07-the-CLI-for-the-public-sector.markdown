---
layout: post
title:  "The Command Line for the Public Sector"
date:   2013-08-07 16:05:00
categories: tutorial
---

I attended [Transparency Camp][tcamp] this year and I still have ideas and observations from that unconference that need to be expressed. The people I met were really wonderful, but there was an apparent gap between the technical and the non-technical. There was a subcategory of the non-technical who clearly wanted to improve their technical skills, but were overwhelmed by the detail that some of the technical presentations would dive into. This was the most apparent at a talk about getting started with GitHub. Other than me and the two GitHub employees in the audience, everyone else seemed like they had heard GitHub used as a sexy buzzword, but really had no idea what it was. 

I thought I could improve upon that talk by writing a get-your-feet-wet style tutorial on basic Git and GitHub for complete novices (I will in a later post). However if you really are a _complete_ novice, then you probably don't know how to use the command line! If you want to get started with Git, GitHub, or computer programming in general, understanding basic command line use is _fundamental_.

Getting started:

If you're on a Mac, start up Terminal which can be found in Applications -> Utilities. If you're on Windows, start up PowerShell which you can find most easily by going to your start menu and searching for PowerShell. 

As you may know, files on your computer are organized in a hierarchy of folders. Programmers call folders "directories" (they  really mean the same thing). There is a directory that contains all other directories called the "root directory", which is likely called `Macintosh HD` on Mac or your `C:\` drive on Windows.

{% highlight bash %}
Seans-MacBook-Air:~ sean$ echo hello
hello
Seans-MacBook-Air:~ sean$ cp -r /hey /hello
{% endhighlight %}

[tcamp]: http://transparencycamp.org/
