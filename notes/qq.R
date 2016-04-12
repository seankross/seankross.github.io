# By Sean Kross February 2016
# Licensed CC0
# https://creativecommons.org/publicdomain/zero/1.0/

set.seed(2-25-16)
par(mfrow = c(1, 2))

n <- 1000
normal_density <- dnorm(seq(-4, 4, 0.01))
zs <- seq(-4, 4, 0.01)

hist_ <- function(x, ...){
  hist(x, breaks = 30, xlab = "Z", ylab = "",  yaxt='n', freq = FALSE, ...)
  lines(zs, normal_density, type = "l", col = "red", lwd = 2)
}

# Gaussian Normal
gaussian_rv <- rnorm(n)

hist_(gaussian_rv, main = "Gaussian Distribution")

qqnorm(gaussian_rv)
qqline(gaussian_rv, col = "blue", lwd = 2)

# Skewed Right
skew_right <- c(gaussian_rv[gaussian_rv > 0] * 2.5, gaussian_rv)

hist_(skew_right, main = "Skewed Right", ylim = c(0, max(normal_density)))

qqnorm(skew_right)
qqline(skew_right, col = "blue", lwd = 2)

# Skewed Left
skew_left <- c(gaussian_rv[gaussian_rv < 0]*2.5, gaussian_rv)

hist_(skew_left, main = "Skewed Left", ylim = c(0, max(normal_density)))

qqnorm(skew_left)
qqline(skew_left, col = "blue", lwd = 2)

# Fat Tails
fat_tails <- c(gaussian_rv*2.5, gaussian_rv)

hist_(fat_tails, main = "Fat Tails", ylim = c(0, max(normal_density)), xlim = c(-10, 10))

qqnorm(fat_tails)
qqline(fat_tails, col = "blue", lwd = 2)

# Thin Tails (Just a bad draw...)
thin_tails <- rnorm(n, sd = .7)

hist_(thin_tails, main = "Thin Tails")

qqnorm(thin_tails)
qqline(thin_tails, col = "blue", lwd = 2)

# Thin Tails
thin_tails <- rnorm(n, sd = .7)

hist_(thin_tails, main = "Thin Tails")

qqnorm(thin_tails)
qqline(thin_tails, col = "blue", lwd = 2)

# Bimodal
bimodal <- c(rnorm(500, -1, .25), rnorm(500, 1, .25))
  
hist_(bimodal, main = "Bimodal", xlim = c(-2, 2))

qqnorm(bimodal)
qqline(bimodal, col = "blue", lwd = 2)

# @drob

batch1_seed <- c(550, 600, 650, 700, 750, 770, 800)

batch2_seed <- c(530, 550, 575, 600, 660, 725,800)

batch1 <- replicate(500, {
  seed <- sample(batch1_seed, 1)
  rnorm(1, mean = seed, 15)
})

batch2 <- replicate(500, {
  seed <- sample(batch2_seed, 1)
  rnorm(1, mean = seed, 15)
})

h1 <- hist(batch1, breaks = 30)
h2 <- hist(batch2, breaks = 30)

plot(h1, col = rgb(0, 0, 1, .25), xlim = c(450, 850),
     ylim = c(0, 40), xlab = "Random Variable",
     main = "@drob", ylab = "", yaxt = "n")
plot(h2, col = rgb(1, 0, 0, .25), xlim=c(0, 10), add=T,
     ylab = "",  yaxt='n')

par(xpd = TRUE)
legend(350, 40, c("Batch 1", "Batch 2"), bty = "n",
       pch = 15, col = c(rgb(0, 0, 1, .25), rgb(1, 0, 0, .25)))
par(xpd = FALSE)

qqplot(batch2, batch1, xlim = c(300, 900), 
       ylim = c(300, 900), xlab = "Batch 2",
       ylab = "Batch 1", main = "Q-Q Plot")
abline(a = 0, b = 1, col = "blue", lwd = 2)
