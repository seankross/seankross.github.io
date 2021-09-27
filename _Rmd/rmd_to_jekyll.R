#!/usr/bin/Rscript --vanilla

# Adapted from https://github.com/dgrtwo/dgrtwo.github.com/blob/master/_scripts/knitpages.R

KnitPost <- function(input, outfile, figsfolder, cachefolder, base.url="/") {
  # this function is a modified version of an example here:
  # http://jfisher-usgs.github.com/r/2012/07/03/knitr-jekyll/
  require(knitr);
  opts_knit$set(base.url = base.url)
  fig.path <- paste0(figsfolder, sub(".Rmd$", "", basename(input)), "/")
  cache.path <- file.path(cachefolder, sub(".Rmd$", "", basename(input)), "/")
  
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(cache.path = cache.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll(highlight = "pygments")
  knit(input, outfile, envir = parent.frame())
  
  # Add Inline Attribute List
  post.md <- readLines(outfile)
  images <- grep("^!\\[center\\]", post.md)
  for(i in images){
    post.md[i] <- paste0(post.md[i], '{: .img-thumbnail max-width="100%" height="auto"}')
  }
  writeLines(post.md, outfile)
}

knit_folder <- function(infolder, outfolder, figsfolder, cachefolder) {
  for (infile in list.files(infolder, pattern = "*.Rmd", full.names = TRUE)) {
    #pattern = "\\d\\d\\d\\d\\-\\d\\d\\-\\d\\d\\-"
    print(infile)
    # folder = ifelse(grepl(pattern, infile), outfolder, "pages")
    outfile = file.path(outfolder, sub(".Rmd$", ".md", basename(infile)))
    print(outfile)
    
    # knit only if the input file is the last one modified
    if (!file.exists(outfile) |
        file.info(infile)$mtime > file.info(outfile)$mtime) {
      KnitPost(infile, outfile, figsfolder, cachefolder)
    }
  }
}

rmarkdown::render(input = "index.Rmd")

knit_folder(infolder = "_Rmd", outfolder = "_posts", 
            figsfolder = "img/", cachefolder = "_cache/")
