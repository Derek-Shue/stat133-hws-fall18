#' @title count_vowels
#' @description counts the number of vowels in a character string
#' @param a string (character)
#' @return the number of vowels as a numeric vector
count_vowels <- function(x){
  if(typeof(x) != "character"){
    stop("invalid input; a string was expected")
  }
  x = tolower(x)
  a=0
  e=0
  i=0
  o=0
  u=0
  for(j in 1:nchar(x)){
    if(substr(x,j,j) == "a"){
      a = a + 1
    }
    if(substr(x,j,j) == "e"){
      e = e + 1
    }
    if(substr(x,j,j) == "i"){
      i = i + 1
    }
    if(substr(x,j,j) == "o"){
      o = o + 1
    }
    if(substr(x,j,j) == "u"){
      u = u + 1
    }
  }
  return(c("a" = a, "e" = e, "i" = i, "o" = o, "u" = u))
}