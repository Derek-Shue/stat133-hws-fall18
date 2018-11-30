#' @title rolls extraction
#' @description extracts the value of a given roll
#' @param a rolls object
#' @return the value of a given roll
#' @export
"[.rolls" <- function(x, i){
  x$rolls[i]
}

#' @title rolls replacement
#' @description replaces the value of a given roll
#' @param a rolls object
#' @return none
#' @export
"[<-.rolls" <- function(x, i, value){
  x$rolls[i] <- value
  return(x)
}

#' @title rolls addition
#' @description adds more rolls to a rolls object
#' @param a rolls object
#' @return none
#' @export
"+.rolls" <- function(x, incr){
  x$rolls = c(x$rolls, sample(x$sides, incr, replace = TRUE, x$prob))
  x$total = x$total + incr
  return(x)
}
