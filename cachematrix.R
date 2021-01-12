## Put comments here that give an overall description of what your
## functions do

## #makeCacheMatrix: This function creates a special
# "matrix" object that can cache its inverse.

makeCacheMatrix <- function(m = matrix()){
  i <- NULL
  set <- function(y) {
    m <<- y
    i <<- NULL
  }
  get <- function() m
  set_inverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  #make list of inputs for function
  list(set = set, 
       get = get,
       set_inverse = set_inverse,
       getinverse = getinverse)
}


#cacheSolve: This function computes the inverse of the special
#"matrix" returned by makeCacheMatrix above.
#If the inverse has already been calculated (and the matrix has not changed), 
#then the cachesolve should retrieve the inverse from the cache.
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
