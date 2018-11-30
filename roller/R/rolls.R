#' @title check times
#' @description checks to see if the die is rolled a valid number of times
#' @param number of times rolled (int)
#' @return TRUE or FALSE
#' @export
check_times <- function(times){
  if ((times < 1) | (times %% 1 != 0)){
    return(FALSE)
  }
  return(TRUE)
}

#' @title rolls print
#' @description displays the class of the object as well as the generated rolls
#' @param rolls object
#' @return none
#' @export
print.rolls <- function(x){
  cat('object "rolls"\n\n')
  rolls = sample(x$sides, x$total, replace = TRUE, x$prob)
  print(rolls)
  invisible(x)
}

#' @title roll constructor
#' @description creates a roll object
#' @param device (object of class 'device')
#' @param number of times rolled (int)
#' @return a "rolls" object
#' @export
roll <- function(device, times = 1){
  if(class(device) != "device"){
    stop("device must be of class device")
  }
  check_times(times)
  rolls = sample(device$sides, size = times, replace = TRUE, device$prob)
  sides = device$sides
  prob = device$prob
  total = times
  res = list(rolls = rolls, sides = sides, prob = prob, total = total)
  class(res) = "rolls"
  return(res)
}

#' @title rolls summary
#' @description summarizes the results of a number of rolls
#' @param a rolls object
#' @return a table summarizing the rolls
#' @export
summary.rolls <- function(x, ...){
  count = rep(0,length(x$sides))
  for (i in 1:length(x$rolls)){
    for (j in 1:length(x$sides)){
      if (x$rolls[i] == x$sides[j]){
        count[j] = count[j] + 1
      }
    }
  }
  freqs <- data.frame(
    side = x$sides,
    count = count,
    prop = count/sum(count)
  )
  obj <- list(freqs = freqs)
  class(obj) <- "summary.rolls"
  obj
}

#' @title print rolls summary
#' @description prints the summary of a number of rolls
#' @param a summary of rolls
#' @return none
#' @export
print.summary.rolls <- function(x, ...){
  cat('summary "rolls"\n\n')
  print(x$freqs)
  invisible(x)
}
