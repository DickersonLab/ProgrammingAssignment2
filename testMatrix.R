## Based on Test code from Discussion Forum post by Gregory D Horne
#set up a random square matrix o 0's and 1's
# occasionally the matrix will not be invertible, if so just try again
mdim <- 5
A <- round(matrix(runif(mdim  * mdim ), mdim , mdim ))
Ainv <- solve(A)
Ainv
A1 <- makeCacheMatrix(A)
A1$get()
#should repeat A 
A1$getinv()
#NULL
cacheSolve(A1)
#A inverse
A1$getinv()  # this is  to show you that the matrix inv has been stored and does not affect anything
#A inverse
cacheSolve(A1)
#getting cached data
#A inverse

#Try a new matrix
mdim <-6
A1$set(round(matrix(runif(mdim  * mdim ), mdim , mdim )))
A1$getinv()
#NULL
cacheSolve(A1)
#[1] 25
cacheSolve(A1)

A1$get()
