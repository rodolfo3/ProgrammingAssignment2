## cached matrix operations

## cached matrix constructor

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(i) inverse <<- i
    getinverse <- function() inverse
    list(
        set=set,
        get=get,
        setinverse=setinverse,
        getinverse=getinverse
    )
}


## get inverse matrix from cache, calculating and
## storing it on the cache if needed

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        if (!is.null(inverse)) {
            message("returning cached inverse")
        } else {
            inverse <- solve(x$get(), ...)
            x$setinverse(inverse)
        }
        inverse
}
