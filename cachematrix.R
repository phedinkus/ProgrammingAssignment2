## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  cached_inverse <- NULL
  set <- function(y) {
    x <<- y
    cached_inverse <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) cached_inverse <<- inverse
  get_inverse <- function() cached_inverse
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x) {
  ## Return a matrix that is the inverse of 'x'
  inverse_matrix <- x$get_inverse()

  if(!is.null(inverse_matrix)) {
    message("getting cached inverse")
    return(inverse_matrix)
  }

  message("setting inverse cache")
  inverse_matrix <- solve(x$get())
  x$set_inverse(inverse_matrix)
  inverse_matrix
}
