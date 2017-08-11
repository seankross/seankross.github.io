---
layout: post
title: "Simulating Systems with Interactive Graphics"
date: 2017-08-11 13:00:00
jumbo_title: Simulating Systems with Interactive Graphics
jumbo_subtitle:
---

On August 3rd I gave the following talk at the 2017 Joint Statistical Meetings
as part of a session titled 
["Creating Interactive Graphics"](https://ww2.amstat.org/meetings/jsm/2017/onlineprogram/ActivityDetails.cfm?SessionID=213963) 
organized by
[Peter Hickey](https://twitter.com/PeteHaitch) and
[John Muschelli](https://twitter.com/StrictlyStat). The talk was followed by a
panel discussion with fellow speakers [Carson Sievert](https://twitter.com/cpsievert)
and [Leo Collado-Torres](https://twitter.com/fellgernon). You can find the slides
for this talk [here](http://seankross.com/jsm-talk/). During this talk I
discussed an R package I'm currently working on called p5 which you can check
out [on GitHub](https://github.com/seankross/p5).

---


<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/1.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>When we think about statistical graphics we most often think about graphs that visualize one, two, or three dimensions like a box plot or a scatter plot. Those kinds of graphs help us visualize trends, model fits, and residuals which are all valuable insights for statisticians. Lately I&#39;ve become interested in visualizations beyond the traditional X-Y plane, which I hope can allows us to communicate new kinds of insights interactively.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/2.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>In the past year the public health community has lost a few of its legends including Hans Rosling, the founder of <a href="https://www.gapminder.org/">Gapminder</a>. Gapminder does incredible work promoting data about human development and enabling the public to have a better understanding of global public health problems.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/3.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>In general I&#39;m not a fan of Ted talks, but Hans Rosling&#39;s talk <a href="https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen"><em>The Best Stats You&#39;ve Ever Seen</em></a> is must-see because of his signature presentation style and his use of interactive graphics. When he gave this talk in 2006 there were virtually no off-the-shelf interactive graphics packages so Gapminder built their own, which Dr. Rosling uses during his talk to the amazement of the audience.  I&#39;ve been thinking about this talk and about how it conveys intuition in three dimensions.  Seeing countries rise and fall along human development parameters across time allows the audience to think of each country as an independent agent in a system. As the system evolves Dr. Rosling walks the audience through how policy changes that were made in each country effect their movement in the system and the resulting societal improvements.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/4.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>As statisticians we&#39;re often interested in studying systems - so we create models that approximate the parameters of a system based on individual outcomes. However conveying what it is that our models are trying to say is often difficult. When I look at a table of coefficients from a linear model it often takes me a few minutes to understand the relationships between terms and their interactions.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/5.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>I&#39;m sure you can relate to my experience during the recent Presidential election when some of my friends asked me my opinion about certain electoral prediction models. This graphic shows the outcome of thousands of simulations run under FiveThirtyEight&#39;s model a few days before the election. I tried to explain what it means for a model to give a candidate a ~25% chance of winning, but I still felt that the intuition behind these predictive models wasn&#39;t being conveyed by their creators. After the election there was considerable outrage by the public which is summed up pretty well by the following tweet.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/6.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Anybody who flipped a coin twice would not consider the occurence of two heads in a row to be a miracle, and yet there is a widespread belief that groups like FiveThrityEight who took into account a fair amount of uncertainty in their model &ldquo;got the election wrong.&rdquo;</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/7.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Now I&#39;d like to share with you some work that I really admire, work which I believe conveys an intuition through the user&#39;s ability to interact with the systems being examined.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/8.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>The Parable of the Polygons was created by <a href="https://twitter.com/vihartvihart">Vi Hart</a> and <a href="https://twitter.com/ncasenmare">Nicky Case</a> in order to demonstrate how small individual biases can have large societal consequences in terms of segregation. This project is based on the work of Thomas Schelling&#39;s <a href="https://www.stat.berkeley.edu/%7Ealdous/157/Papers/Schelling_Seg_Models.pdf"><em>Dynamic Models of Segregation</em></a>.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/9.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>I&#39;m just going to do a quick demo but I really encourage you to <a href="http://ncase.me/polygons/">go play with this application yourself</a>. In this model there are two kinds of people, blue squares and yellow triangles. As you can see some of these shapes are rocking back and forth with their mouths open - clearly uncomfortable, while other shapes are happy and sitting still. The unhappy shapes won&#39;t be happy unless they&#39;re surrounded by a certain percentage of shapes that are like them. You can click and drag each shape individually to make it more happy, or you can click the &ldquo;Start Movin&#39;&rdquo; button and the unhappy shapes will randomly move until they find a happy position. Over time you can see that this environment becomes drastically more segregated, and if you increase the bias the arrangement of the shapes becomes even more segregated.  I believe this kind of demonstration, where users can adjust model parameters and witness resulting behavior conveys an intuition about this sociological model that isn&#39;t expressed by showing the relationship between bias and segregation alone.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/10.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Let&#39;s look at another example of these types of interactive models, this one also created by Nicky Case.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/11.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Once again I strongly encourage you to <a href="http://ncase.me/ballot/">play with this on your own</a>. This interactive model explores different kinds of voting procedures, most of which have been developed by political scientists without being put into practice. In this situation I&#39;ve set up a reenactment of the US election of 1912. Each little circle in the in the big square on the screen represents one voter, and with the First Past the Post electoral rules each dot will vote for the shape that is closest to it.  Now if you remember your history books you&#39;ll recall that in 1912 Woodrow Wilson (the blue square) was the Democratic challenger to the incumbent Republican William Howard Taft (the yellow triangle). However Theodore Roosevelt, a former President and third party candidate entered the race with a political platform that was close to Taft&#39;s. If I drag Theodore-red-hexagon-Roosevelt slightly up and to the left, you can see that it creates a &ldquo;spoiler effect&rdquo; allowing the blue square (Wilson) to win the election! However if I leave Teddy where he is and simply change the voting system to &ldquo;Score&rdquo; you can see that the yellow triangle wins the election instead of the blue square. Users can therefore experiment with different kinds of voter preferences, numbers of candidates, and voting systems to see how a democratic process is effected.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/12.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>The two previous interactive models are very engaging and they were enabled by individuals who have years of art and design experience on top of deep and dangerous Javascript knowledge. I don&#39;t believe it&#39;s reasonable to teach every data scientist to have this level of Javascript fluency, so I was thinking about how existing technologies could be adapted with current data science thinking to produce interactive models in this style.  It also would be nice to be able to introduce web technologies and Javascript within the familiarity of a data scientist&#39;s pipeline.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/13.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>For a while I&#39;ve admired the <a href="https://p5js.org/">p5.js</a> project by <a href="https://twitter.com/laurmccarthy">Lauren McCarthy</a> which she developed while at <a href="https://twitter.com/ITP_NYU">NYU ITP</a>. The p5 library turns your web browser into a sketchbook, where certain p5 functions create lines, circles, squares, and other shapes on a webapge.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/14.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>I was looking through the p5 documentation and there are many examples that look like this page, where first you set up the drawing environment in the <code>setup</code> function, and then you specify what will be drawn in the <code>draw</code> function. This code sketches out a complicated curve, and each <code>curveVertex</code> function call specifies an inflection point in the curve. After seeing several code examples like this I started to realize&hellip;</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/15.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>&hellip;these arguments look like a data frame! The first and second arguments are just the positions of each vertex on the canvas, but you could imagine binding other rectangular data to functions in p5.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/16.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Then I started thinking: what if you could combine the data wrangling and rectangling power of R with the creative expressiveness of p5? In order to test this idea I started building the <a href="https://github.com/seankross/p5">p5</a> library for R, an <a href="http://www.htmlwidgets.org/">htmlwidget</a> in the style of <a href="https://github.com/rstudio/leaflet">leaflet</a> or <a href="https://github.com/ropensci/plotly">plotly</a>. Let&#39;s go through a few demos now about what you can do with p5 for R.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/17.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>All of the following are live examples, meaning that they were rendered within this R Markdown presentation. Here&#39;s a very simple example where first we&#39;ll load the p5 library, then to start this sketch we&#39;ll use the <code>p5()</code> function, which acts much like the <code>leaflet()</code> function. The <code>createCanvas()</code> function creates a drawing canvas that is 100 by 100 pixels wide, and then the <code>background()</code> function fills the canvas in with Hopkins blue. The <code>rect()</code> function draws a white rectangle starting at the x and y coordinates of 10 with a height and width of 50 pixels. Similarly to other R packages built with htmlwidgets each function takes the full p5 sketch as the first argument so that the pipe operator can be used.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/18.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>In this second example we&#39;ll first create a data frame with values for the position, width, and height of each square. Then we can pipe the data frame into almost the same code as we had before, except this time the <code>rect()</code> function knows to find the upstream data frame and to draw a rectangle for each row.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/19.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>You can also specify more complicated shapes and lines with p5. In this example I&#39;m using some constants that come with the p5.js library which you can access with the formula operator from R.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/20.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Since p5 allows you to draw using data frames you can use the <code>bind_sketches()</code> function to combine multiple drawings. In this example 13 rectangles are specified with a data frame, and then they&#39;re combined with one rectangle.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/21.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>The resulting image is the beginning of drawing an American flag.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/22.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>Since this is a lecture about interactive graphics, let&#39;s talk about interactivity with p5! With p5&#39;s <code>mouseX</code> constant we can draw a line that appears wherever the mouse is hovering.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/23.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>We can also draw circles, and we can track the x and y position of the mouse.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/24.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>If you want to add Javascript code directly to a sketch you can do so with the <code>js()</code> function. This allows users who want to experiment with Javascript to use it while still in the R environment. This <code>if</code> statment turns the brush on this canvas to black.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/25.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>This project is still a work in progress, but my hope is that bringing p5 into R will at least expose more people to the basics of Javascript, though one day it could even enable folks to create their own interactive models.</p>


</div>

</div>
<div class="row">

<div class="col-md-6 pull-left">

<!-- <iframe src="" style="width:400px;height:300px" frameborder="0" scrolling="no"></iframe> -->

<img style="width:100%;max-width:400px" src="/img/2017-08-11-Beyond-Axes-Simulating-Systems-with-Interactive-Graphics/26.png">

</div>

<div class="col-md-1 hidden-xs">
</div>

<div class="col-md-5 pull-right">

<p>👋</p>


</div>

</div>
