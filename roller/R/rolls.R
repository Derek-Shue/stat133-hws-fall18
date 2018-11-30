#' @title check times
#' @description checks to see if the die is rolled a valid number of times
#' @param number of times rolled (int)
#' @return TRUE or FALSE
check_times <- function(times){
  if ((times < 1) | (times %% 1 != 1)){
    return(FALSE)
  }
  return(TRUE)
}

#' @title rolls print
#' @description displays the class of the object as well as the generated rolls
#' @param rolls object
#' @return none
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
print.summary.rolls <- function(x, ...){
  cat('summary "rolls"\n\n')
  print(x$freqs)
  invisible(x)
}

#' @title rolls extraction
#' @description extracts the value of a given roll
#' @param a rolls object
#' @return the value of a given roll
"[.rolls" <- function(x, i){
  x$rolls[i]
}

#' @title rolls replacement
#' @description replaces the value of a given roll
#' @param a rolls object
#' @return none
"[<-.rolls" <- function(x, i, value){
  x$rolls[i] <- value
  return(x)
}

#' @title rolls addition
#' @description adds more rolls to a rolls object
#' @param a rolls object
#' @return none
"+.rolls" <- function(x, incr){
  x$rolls = c(x$rolls, sample(x$sides, incr, replace = TRUE, x$prob))
  x$total = x$total + incr
  return(x)
}
