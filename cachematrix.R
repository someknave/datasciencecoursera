## This pair of functions is designed to work together to find the inverse of a matrix if it is
## not known and cache it so that it can be retreived without solving the matrix again.

## Create a list of fuction calls that can be called by the cacheSolve function

makeCacheMatrix <- function(x = matrix()) {
        ## Initialise m to NULL so that it is defined if getinverse calls it.
    m <- NULL
        ## Define set function; can be used to change (and cache) the matrix to be solved, resets solution to NULL
        ## not used in cacheSolve but very useful both for testing and for expanded functionality.
     set <- function(y) {
         x <<- y
         m <<- NULL
     }
        ## Define get function; can be used to return the matrix to be solved.
    get <- function() x
        ## Define setinverse function; can be used to cache the newly calculated inverse of initial matrix. 
    setinverse <- function(inverse) m <<- inverse
        ## Define getinverse function; can be used to retrieve inverse of initial matrix if calculated, or null if not.
    getinverse <- function() m
        ## Create list of function calls refering to x and m so that they can be referenced from another function.
    list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


## Can cache and later retreive the inverse of a matrix set in makeCacheMatrix 

cacheSolve <- function(x, ...) {
        ## Return the inverse of the matrix if it exists
    m <- x$getinverse()
        ## check if returned matrix isn't NULL; if so return the inverse with a message "getting cached data".
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
        ## if nothing was returned; receive the matrix that we want to find the inverse of and store in data
    data <- x$get()
        ## calculate the inverse of the matrix in data; store in m.
    m <- solve(data, ...)
        ## cache the matrix m using setinverse.
    x$setinverse(m)
        # return the matrix m
    m
}
