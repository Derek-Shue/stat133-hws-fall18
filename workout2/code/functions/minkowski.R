#' @title Minkowski Distance
#' @description computes the Minkowski distance of order p between two points
#' @param point vector (numeric)
#' @param second point vector (numeric)
#' @param order (numeric or character)
#' @return the computed distance
minkowski <- function(x,y,p=1){
  if(length(x) != length(y)){
    stop("x and y have different lengths")
  }
  if(class(p) == "numeric"){
    if(p < 1){
      stop("p cannot be less than 1")
    }
  }
  else{
    if(p != "max"){
      stop("invalid character value for p")
    }
  }
  if(p == "max"){
    pmax = rep(0,length(x))
    for(i in length(x)){
      pmax[i] = abs(x[i] - y[i])
    }
    return(max(pmax))
  }
  distance = 0
  for(i in 1:length(x)){
    distance = distance + (abs(x[i] - y[i]))^p
  }
  return(distance^(1/p))
}