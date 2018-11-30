#' @title Check sides
#' @descriptioin check if the sides are valid
#' @param sides of a die (numeric vector)
#' @return TRUE or FALSE
#' @export
check_sides <- function(a){
  if (length(a) < 2){
    stop("sides must contain more than one element")
  }
  sort(a)
  for (i in 1:(length(a)-1)){
    if (a[i] == a[i+1]){
      stop("sides cannot contain duplicated elements")
    }
  }
  TRUE
}

#' @title check prob
#' @description checks if probability input is valid
#' @param probability for each side of the die (numeric vector)
#' @return TRUE or FALSE
#' @export
check_prob <- function(prob){
  if (class(prob) != "numeric"){
    stop("prob must be numeric")
  }
  for (i in 1:length(prob)){
    if ((prob[i] < 0) | (prob[i] > 1)){
      stop("prob must be between 0 and 1")
    }
  }
  if (sum(prob) != 1){
    stop("total prob must equal 1")
  }
  TRUE
}

#' @title device print
#' @description displays the class of the object as well as a tabular display of the sides and probabilities
#' @param device object
#' @return none
#' @export
print.device <- function(x){
  cat('object "device"\n\n')
  cd <- data.frame(
    side = x$sides, prob = x$prob
  )
  print(cd)
  invisible(x)
}

#' @title device constructor
#' @description creates an object called 'device'
#' @param number of sides (numeric vector)
#' @param probability of each side (numeric vector)
#' @return a device object
#' @export
device <- function(sides = c(1,2), prob = c(0.5, 0.5)){
  if (length(sides) != length(prob)){
    stop("Sides and prob must be the same length")
  }
  # check params
  check_sides(sides)
  check_prob(prob)
  res = list(sides = sides, prob = prob)
  class(res) <- "device"
  return(res)
}

#' @title device check
#' @description checks whether an input is of class "device"
#' @param an R object
#' @export TRUE or FALSE
is.device <- function(device){
  if (class(device) == "device"){
    return(TRUE)
  }
  return(FALSE)
}
