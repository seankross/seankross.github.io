---
layout: note
title: prng bitmap
header: Simple PRNG Bitmaps in R
---

If you have a csv of generated numbers you should use:

 `my_file <- read.csv("/path/to/your_file.csv")` 

in order to import your data. This will create an object `my_file` that you can use in your workspace.

Here is the following R code I used to create a bitmap based on criteria similar to yours:

```r
# Create a 50 by 50 matrix of 2500 numbers 
# uniformly distributed between 0 and 1
data <- matrix(runif(2500),50,50)

# Create a copy so the original data isn't destroyed
mat <- data

# Classify each cell in the matrix as above or below 0.5
for(row in 1:50){
  for(col in 1:50){
    if(mat[row,col] > .5){
      mat[row,col] <- 1
    } else {
      mat[row,col] <- 0
    }
  }
}

# Create the bitmap
image(mat)
```