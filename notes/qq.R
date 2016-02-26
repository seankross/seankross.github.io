set.seed(2-25-16)
par(mfrow = c(1, 2))

hist_ <- function(x, ...){
  hist(x, breaks = 30, xlab = "Z", ylab = "",  yaxt='n', freq = FALSE, ...)
}

n <- 1000
normal_density <- dnorm(seq(-4, 4, 0.01))
zs <- seq(-4, 4, 0.01)

# Gaussian Normal
gaussian_rv <- rnorm(n)

hist_(gaussian_rv, main = "Gaussian Distribution")
lines(zs, normal_density, type = "l", col = "red", lwd = 2)

qqnorm(gaussian_rv)
qqline(gaussian_rv, col = "blue", lwd = 2)

# Skewed Right
skew_right <- c(gaussian_rv[gaussian_rv > 0] * 2.5, gaussian_rv)

hist_(skew_right, main = "Skewed Right", ylim = c(0, max(normal_density)))
lines(zs, normal_density, type = "l", col = "red", lwd = 2)

qqnorm(skew_right)
qqline(skew_right, col = "blue", lwd = 2)

# Skewed Left
skew_left <- c(gaussian_rv[gaussian_rv < 0]*2.5, gaussian_rv)

hist_(skew_left, main = "Skewed Left", ylim = c(0, max(normal_density)))
lines(zs, normal_density, type = "l", col = "red", lwd = 2)

qqnorm(skew_left)
qqline(skew_left, col = "blue", lwd = 2)

# Fat Tails
fat_tails <- c(gaussian_rv*2.5, gaussian_rv)

hist_(fat_tails, main = "Fat Tails", ylim = c(0, max(normal_density)), xlim = c(-10, 10))
lines(zs, normal_density, type = "l", col = "red", lwd = 2)

qqnorm(fat_tails)
qqline(fat_tails, col = "blue", lwd = 2)

# Thin Tails (Just a bad draw...)
thin_tails <- rnorm(n, sd = .7)

hist_(thin_tails, main = "Thin Tails")
lines(zs, normal_density, type = "l", col = "red", lwd = 2)

qqnorm(thin_tails)
qqline(thin_tails, col = "blue", lwd = 2)

# Thin Tails
thin_tails <- rnorm(n, sd = .7)

hist_(thin_tails, main = "Thin Tails")
lines(zs, normal_density, type = "l", col = "red", lwd = 2)

qqnorm(thin_tails)
qqline(thin_tails, col = "blue", lwd = 2)
