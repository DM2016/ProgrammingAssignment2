####final cacheSolve
cacheSolve <- function(x, ...) {
  my_i <- x$getinverse()
  if (!is.null(my_i)) {
    message("getting cached data")
    return(my_i)
  }
  my_data <- x$get()
  my_i <- solve(my_data, ...)
  x$set_inverse(my_i)
  my_i
}