---
layout: note
title: URI Fonts
header: Note to Ramnath
---

First I downloaded the font from [openfontlibrary.org](http://openfontlibrary.org/) though I imagine you can use a font from any source. Upload the font's `.tff` file to Font Squirrel's [Webfont Generator](http://www.fontsquirrel.com/tools/webfont-generator). Make sure to use expert settings and check the "Base64 Encode" box. Download the `.zip` which should include a `stylesheet.css` in the top directory. 

I copied this entire file and pasted it into your original HTML within this tag: `<style type="text/css">...</style>` (inside the `<head>`). The font will then appear wherever `style="font-family: news_cycleregular"` is specified.

This isn't the most programmatic approach but you could package a collection of font URIs with slidify this way.