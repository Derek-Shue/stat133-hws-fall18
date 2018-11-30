#' @title is_hex
#' @description checks whether an input string is a valid hex color without an alpha transparency value
#' @param any input string
#' @return true or false
is_hex <- function(x){
  if(class(x) != "character"){
    stop("invalid input; a string was expected")
  }
  if((nchar(x) != 7) | (substr(x,1,1) != "#")){
    return(FALSE)
  }
  x = toupper(x)
  for(i in 2:nchar(x)){
    if(substr(x,i,i) > "F"){
      return(FALSE)
    }
  }
  return(TRUE)
}

#' @title is_hex_alpha
#' @description checks whether an input string is a valid hex color with an alpha transparency value
#' @param any input string
#' @return true or false
is_hex_alpha <- function(x){
if(class(x) != "character"){
  stop("invalid input; a string was expected")
}
if((nchar(x) != 9) | (substr(x,1,1) != "#")){
  return(FALSE)
}
x = toupper(x)
for(i in 2:nchar(x)){
  if(substr(x,i,i) > "F"){
    return(FALSE)
  }
}
return(TRUE)
}