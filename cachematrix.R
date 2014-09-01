
## Creating an inverse square matrix can be compute intensive. The following functions
## provide caching, so that if a matrix value does not change, then the previously
## calculated Inverse Square matrix is returned.

## makeCacheMatrix creates the cacheMatrix entity which is a list with four functions:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

## Use as follows:
##     myc <- makeCacheMatrix( matrix(1:4, 2, 2))
## 
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) s <<- solve
    getInverse <- function() s
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## cacheSolve will calculate the Inverse if not previously calculated
## If it has been previously calculated, then it returns the cached value
## Use as follows:
##     cacheSolve(myc)
##
cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
    s <- x$getInverse()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data)
    x$setInverse(s)
    s
}
