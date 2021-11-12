## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special object which is a list containing a function to
## set the value of the matrix, get the value of the matrix, set the value of the inverse
## and get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  ## Make a matrix object which can then be cached.
  
  m <- NULL
  
  set <- function(y){
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


## Write a short comment describing this function
## This function computes the matrix object created by the function above.
## If the inverse matrix has already been calculated it returns it from memory
## Otherwise it generates a new inverse and stores that.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ##
  m <- x$getinv()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
    
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
