---
layout: post
title: "Enough Docker to be Dangerous"
date: 2017-09-17 18:30:00
jumbo_title: Enough Docker to be Dangerous
jumbo_subtitle: A Minimal Tutorial
---

[Unlike Jeff Leek](https://simplystatistics.org/2017/08/29/data-science-on-a-chromebook/)
I do most of my software development on a MacBook Pro, but every once in a while
I would like to be able to access a shell on Ubuntu without too much hassle.
One of the main reasons I want to be able to access Ubuntu is because I test
several software packages using [Travis](https://travis-ci.org/), which uses
fresh Ubuntu instances every time my tests are run.
Over the years I've tried using [VirtualBox](https://www.virtualbox.org/) and
[Vagrant](https://www.vagrantup.com/), but recently I've discovered that
[Docker](https://www.docker.com/) absolutely wins this competition in terms of
ease of use.

Docker is a sophisticated software project built on the [Go](https://golang.org/)
programming language for creating distributed and networked web applications, but
it's also wonderful for just accessing an Ubuntu bash terminal. To get started
with Docker you should first
[install it](https://docs.docker.com/engine/installation/) (you want the
Community Edition), then pull up your command line.

## How Docker is Organized

Docker has several abstractions, but there are only two we need to worry about
right now: **images** and **containers**. A Docker image is the blueprint for
the mini computer-within-a-computer that Docker will provide us. The Docker
organization has a website called [Docker Hub](https://hub.docker.com/) which
allows people to distribute their own Docker images. In this case we're about to
get an Ubuntu image from the official Ubuntu page on Docker Hub. A Docker
container is mini computer actively running in your computer. Each container
starts off as a live, running instance of a Docker image.

## Get a Docker Image

We can use `docker pull` on the command line to get a Docker image. In order to
pull a specific image we need to provide the name of the Docker Hub repository
(in this case `ubuntu`) and the tag for a specific image, which corresponds to
a version of Ubuntu. Let's get Ubuntu 14.04 since it's commonly used on Travis:


{% highlight bash %}
docker pull ubuntu:14.04
{% endhighlight %}

```
## 14.04: Pulling from library/ubuntu
## Digest: sha256:6a3e01207b899a347115f3859cf8a6031fdbebb6ffedea6c2097be40a298c85d
## Status: Downloaded newer image for ubuntu:14.04
```

We can look at all of the Docker images that we have available using
`docker images`:


{% highlight bash %}
docker images
{% endhighlight %}

```
## REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
## ubuntu              14.04               c69811d4e993        2 weeks ago         188MB
```

## Start Up a Container

Now that we've downloaded a Docker image we can start up our first container:


{% highlight bash %}
docker run -it ubuntu:14.04
{% endhighlight %}

You should now get a shell prompt that is inside your Docker container! Open up
a second terminal so we can look at all the currently running containers on our
machine:


{% highlight bash %}
docker ps
{% endhighlight %}

```
## CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
## 4313a3f3f11d        ubuntu:14.04        "/bin/bash"         2 minutes ago       Up 27 seconds                           serene_albattani
```

## Stop and Restart a Container

Switching back to our Dockerized Ubuntu shell let's make a small change by
creating a simple text file:


{% highlight bash %}
cd
echo 'My first container!' > readme.txt
{% endhighlight %}

Now let's stop the container with `exit`, which will return us to the shell on
our host computer.


{% highlight bash %}
exit
{% endhighlight %}

We can look at all Docker containers (including stopped containers) by adding
the `-a` flag to `docker ps`:


{% highlight bash %}
docker ps -a
{% endhighlight %}

```
## CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                         PORTS               NAMES
## 4313a3f3f11d        ubuntu:14.04        "/bin/bash"         3 minutes ago       Exited (0) 7 seconds ago                           serene_albattani
```

Let's restart the container with the `docker start` command using the `-ai` flags
and providing the ID of the stopped container:


{% highlight bash %}
docker start -ai 4313a3f3f11d
{% endhighlight %}

We're back in the Ubuntu shell! Let just check to make sure the file we created
is still there:


{% highlight bash %}
cd
cat readme.txt
{% endhighlight %}

```
## My first container!
```

Looking good!


## Create a New Image

While we're in our Ubuntu shell let's create some changes to our
container. For example we might want to be able to download files in our
container, so let's install `curl`:


{% highlight bash %}
sudo apt-get update
sudo apt-get install curl
{% endhighlight %}

All I've done is install `curl`, but you could imagine installing many more
tools and creating some files. In order to save the state of your live container
you need to create a new image. In this way Docker works like Pokemon Red and
Blue: if you mess up during "the game" (your Ubuntu session) you can reset your
instance by `exit`ing the Ubuntu shell and spinning up a new container from a
saved image. In the host (non-Docker) shell let's save this container as a new
image, which is essentially a fresh Ubuntu installation plus `curl`, which we
have installed.
We can create an image from a container with `docker commit` with
the ID for a container and a name for our new image:


{% highlight bash %}
# Get the container ID from `docker ps`
docker commit 4313a3f3f11d ubuntu-curl
{% endhighlight %}

In this case I called the image `ubuntu-curl`, but you can call it whatever you
want. Let's check `docker images` to see our new image:


{% highlight bash %}
# Get the container ID from `docker ps`
docker images
{% endhighlight %}

```
## REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
## ubuntu-curl         latest              32847817ea58        2 minutes ago       220MB
## ubuntu              14.04               c69811d4e993        2 weeks ago         188MB
```

Now starting an Ubuntu container with `curl` already installed is as easy as
`docker run -it ubuntu-curl`.

## Delete Images and Containers

As you can see in the table above our new `ubuntu-curl` image is 220 MB, which
is sort of large to keep around just to avoid the step of installing `curl` in
the future. We can delete an image with `docker rmi` and the image name:


{% highlight bash %}
docker rmi ubuntu-curl
{% endhighlight %}

If we wanted to delete a container (so that it can't be restarted in the future)
we can delete it with `docker rm` and the ID of the container (which you can
get from `docker ps -a`):


{% highlight bash %}
docker rm 4313a3f3f11d
{% endhighlight %}

## Transfer Files In and Out of Containers

Perhaps you've caught on to the pattern that Docker commands mimic standard
Unix commands, in which case it will come as no surprise to you that `docker cp`
allows you to get files in and out of containers. Let's start up a brand new
container and create a file:


{% highlight bash %}
docker run -it ubuntu:14.04

# (Now we're in the Dockerized Ubuntu shell)

cd
echo "very important data" > some-big-file.dat
pwd
{% endhighlight %}

```
## /root
```

Now let's `exit` the container and go back to our host shell where we can use
`docker cp`, the ID of the container, the path to the file we want to copy
to our host, and the path of the copied file on our host:


{% highlight bash %}
exit

# (Now we're in the host shell)

docker ps -a
{% endhighlight %}

```
## CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
## a6c228e05fca        ubuntu:14.04        "/bin/bash"         2 minutes ago       Exited (0) 29 seconds ago                       musing_borg
```


{% highlight bash %}
docker cp a6c228e05fca:/root/some-big-file.dat ~/
cd
cat some-big-file.dat
{% endhighlight %}

```
## very important data
```

It worked! Now let's copy a file from our host into the container:


{% highlight bash %}
echo "- jhudatascience.org" > list-of-cool-websites.txt
echo "- shanellis.github.io" >> list-of-cool-websites.txt
echo "- pgbovine.net" >> list-of-cool-websites.txt
docker cp list-of-cool-websites.txt a6c228e05fca:/root/
docker start -ai a6c228e05fca
{% endhighlight %}

Now we should be in the Ubuntu shell. Did our file make it?


{% highlight bash %}
cd
cat list-of-cool-websites.txt
{% endhighlight %}

```
## - jhudatascience.org
## - shanellis.github.io
## - pgbovine.net
```

Success! One thing to keep in mind: you don't have to stop a container in order
to copy files into or out of it, the container can be running and you can use
another terminal to do `docker cp`.

## Share an Image

One of my favorite Docker features is that you can work in a container and then
easily share an image of that container. If you've been doing significant
amounts of system
configuration or software development and you want to share your carefully
crafted environment with somebody else then Docker seems to be the perfect tool
for you. I'm very excited to use this feature while teaching, since configuring
computing environments often takes up a significant amount of valuable teaching
time.

To start sharing your images you should create your own account on
[Docker Hub](https://hub.docker.com/). Once you have an account you can log in
on the terminal with `docker login`, which will ask you for your Docker Hub
username and password. Logging in on the command line allows you to create and
update images on your Docker Hub profile.

After logging in let's create a new image which features our list of cool
websites:


{% highlight bash %}
docker commit a6c228e05fca cool-websites
{% endhighlight %}

After creating the image that we want to share, we need to `tag` the image with
the name that we want the image to have on Docker Hub. This name should be in
the format of `[Docker Hub username]/[name of image]`. My Docker Hub username
is seankross, so I'll tag this image as `seankross/cool-websites`:


{% highlight bash %}
docker tag cool-websites seankross/cool-websites
{% endhighlight %}

Now we can use the image tag to `push` the image onto Docker Hub:


{% highlight bash %}
docker push seankross/cool-websites
{% endhighlight %}

After a minute of uploading (depending on the speed of your internet connection)
your image should now be
[on Docker Hub](https://hub.docker.com/r/seankross/cool-websites/)! Other Docker
users can now easily get a copy of your uploaded image with `docker pull`. For
example if you wanted to use my `cool-websites` image, then you could use the
command `docker pull seankross/cool-websites` to get the image.

## Getting Help

With any of the Docker sub-commands (`images`, `tag`, `rm`, etc) it's not always
easy to remember what options are available. Thankfully adding the `--help` flag
after any command will list that command's options in a friendly and
understandable way (relative to other command line help programs). To list all
of the Docker sub-commands that are available you can use `docker --help`, but
also check out `docker run --help` and `docker start --help`.

## Docker Data Science Super Powers

Like I briefly discussed before, I teach data science and programming courses
often, and correctly configuring a computing environment for any specific
programming task can be a challenge. Even configuring my own working
environment can be time-consuming, but pre-made Docker images have really helped
my setup workflow.

For example the [Jupyter](http://jupyter.org/) project has a
[Docker Hub account](https://hub.docker.com/u/jupyter/) where they have several
useful images. If you want to get started on a data science project, it can
be as easy as running the following:


{% highlight bash %}
# Download the image
docker pull jupyter/datascience-notebook

# Run the notebook
docker run -it --rm -p 8888:8888 jupyter/datascience-notebook
{% endhighlight %}

The console will then provide you with a URL that you can copy and paste into
a web browser where your Jupyter notebook will be live! The container will
automatically destroy itself after it stops, but to save the container you can
remove the `--rm` flag from the command above.

If - like me - RStudio is more your flavor of data science computing environment
and you want a fresh instance then you should look at the
[Rocker project](https://www.rocker-project.org/), a collaboration between
R legends [Carl Boettiger](https://twitter.com/cboettig) and
[Dirk Eddelbuettel](https://twitter.com/eddelbuettel). Rocker provides several
Docker images which launch pre-configured RStudio instances. My favorite vintage
among these images is [rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse/)
which includes all of RStudio & co's [Tidyverse](https://www.tidyverse.org/)
packages. You can pull the image down and start it up with the following
commands:


{% highlight bash %}
# Download the image
docker pull rocker/tidyverse

# Start up RStudio
docker run -d -p 8787:8787 rocker/tidyverse
{% endhighlight %}

After starting the container just navigate to `localhost:8787` in your web
browser and log in with `rstudio` as the default username and password. Once
you're finished using RStudio you need to stop the container using `docker stop`
with the appropriate container ID, which you can find with `docker ps`.

There's a much bigger Docker world out there, but after getting into Docker a
little bit I realized how all of its features could have big implications for
doing reproducible science! If you're doing data science with Docker I would
love to hear about your experiences.

## Further Reading:

- [ROpenSci's R & Docker Tutorial](https://github.com/ropenscilabs/r-docker-tutorial)
- [Docker's Official Documentation](https://docs.docker.com/)
- [Laurel Duermaël, Docker's In-House Comic Book Artist](https://twitter.com/laurelcomics)
