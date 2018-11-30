#' @title reverse_chars
#' @description reverses a string by characters
#' @param a string
#' @return the string reversed
reverse_chars <- function(x){
  reverse = x
  for(i in 1:nchar(x)){
    place = nchar(x)-i+1
    substr(reverse,i,i) <- substr(x,place,place)
  }
  return(reverse)
}