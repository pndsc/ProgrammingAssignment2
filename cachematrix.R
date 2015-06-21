## Functions for managing a matrix which will cache its inverse.
## Easily extendable to cache other versions

## Creates a matrix which will cache its inverse if it is requested
makeCacheMatrix <- function(m = matrix()) {
        im <- NULL
        set <- function(y) {
                m <- y
                im <- NULL
        }

        get <- function() m

		## Lazy implementation. Will only create inverse when needed
        getinverse <- function() {
                if(is.null(im)) {
                        im <- solve(m)
                }

                im
        }

        list(set =set,
             get=get,
             getinverse=getinverse)
}


## Manages the special matrix returned by makeCacheMatrix()
## Note, the ... parameters for the inverse are ignored since the inverse
## is cached after first access.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        x$getinverse()
}
