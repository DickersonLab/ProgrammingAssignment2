## This function either computes or retrieves the matrix inverse if it is available
## it currently uses the solve function to find the inverse, however ginv (moore-penrose generalized inverse) from the MASS package is more
## general and would be a better choice. Completee error checking for the existence of the inverse
## is not included as the assignment assumes that the matrix is invertible.
##
## Written by Julie A Dickerson, Oct 2014, adapted from code provided by course called cacheman.R

makeCacheMatrix <- function(X = matrix()) {
 ## sets up getting or setting the matrix, if does not exist then computes  
  M <- NULL
  set <- function(Y) {
    X <<- Y
    M <<- NULL
  }
  get <- function() X
  setinv <- function(solve) M <<- solve
  getinv <- function() M
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


# cachematrix routine for calling getters and setters
cacheSolve <- function(X, ...) {
  M <- X$getinv()
  if(!is.null(M)) {
    message("getting cached data")
    return(M)
  }
  data <- X$get()
  M <- solve(data, ...)
  X$setinv(M)
  M
}
