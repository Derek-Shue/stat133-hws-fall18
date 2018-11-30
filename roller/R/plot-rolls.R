#' @title plot rolls
#' @description produces a barplot of the result of a "rolls" object
#' @param a "rolls" object
#' @return a barplot
plot.rolls <- function(x, ...){
  barplot(summary(x)$freqs$prop, names.arg = summary(x)$freqs$side, main = "Relative frequencies in a series of rolls", xlab = "sides of device", ylab = "relative frequency")
}
plot(fair_50rolls)
