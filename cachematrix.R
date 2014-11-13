## These functions are designed to cache a Matrix Inversion result.
## This is done because Solving (i.e. inverting) a Matrix can be expensive

## This function generates an enhanced "Matrix Object" that has embedded methods (i.e. functions)
##   that (get/set) the value of the (matrix/inverse).

makeCacheMatrix <- function(x = matrix()) {
  S <- NULL
  set <- function(y) {
    x <<- y
    S <<- NULL
  }
  get <- function() x
  setSolve <- function(Solve) S <<- Solve
  getSolve <- function() S
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}


## This function returns the Inverse of an enhanced "Matrix Object".
##   It does so efficiently by using the available get/set methods.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  S <- x$getSolve()
  if(!is.null(S)) {
    message("getting cached data")
    return(S)
  }
  data <- x$get()
  S <- solve(data, ...)
  x$setSolve(S)
  S
}

temp.dim <- 1000L

test1 <- makeCacheMatrix()
test1$set(matrix(rnorm(temp.dim^2),nrow=temp.dim))
system.time(cacheSolve(test1))
system.time(cacheSolve(test1))
system.time(cacheSolve(test1))

test2 <- makeCacheMatrix()
test2$set(matrix(rnorm(temp.dim^2),nrow=temp.dim))
system.time(cacheSolve(test2))
system.time(cacheSolve(test2))
system.time(cacheSolve(test2))

str(test1)

environment(cacheSolve)
environment(makeCacheMatrix)

environment(test1$set)
environment(test2$set)

ls.str(environment(test1$set))
ls.str(environment(test2$set))