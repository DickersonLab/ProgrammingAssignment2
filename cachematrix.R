## This function either computes or retrieves the matrix inverse if it is available
## it currently uses the solve function to find the inverse, however ginv (moore-penrose generalized inverse) from the MASS package is more
## general and would be a better choice. Completee error checking for the existence of the inverse
## is not included as the assignment assumes that the matrix is invertible.
##
## Written by Julie A Dickerson, Oct 2014, adapted from code provided by course called cacheman.R

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}
}

# cachematrix routine for calling getters and setters
cachematrix <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
