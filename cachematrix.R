## These functions are designed to cache a Matrix Inversion result.
## This is done because Solving (i.e. inverting) a Matrix can be expensive

## This function generates an enhanced "Matrix Object" that has embedded methods (i.e. functions)
##   that (get/set) the value of the (matrix/inverse).

makeCacheMatrix <- function(x = matrix()) {

}


## This function returns the Inverse of an enhanced "Matrix Object".
##   It does so efficiently by using the available get/set methods.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
