## These two functions create a matrix object that can cache its inverse values. 

## This first function creates a matrix object that caches and returns the values
## assigned to the matrix.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
   get <- function() x
   getMatrix <- function() m
   list (set = set, get = get,
         setMatrix = setMatrix,
         getMatrix = getMatrix)
}


## This function gets the inverse of a matrix by calculating or retrieving its
## cached value.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getMatrix()
  if(!is.null(m)) {
    message ("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setMatrix(m)
  m
}
