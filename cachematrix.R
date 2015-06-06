#Please see README file for notes and example test runs



makeCacheMatrix <- function(x = matrix()) {
#I is the inverse of x
  I <- NULL
#set the matrix x and I to a cached variable
  set <- function(y) {
    x <<- y
    I <<- NULL
  }
#functions to get the matrix, the inverse, and set the inverse (a function which should only be used in cacheSolve not independently)  
  get <- function() x
  setinv <- function(inv)I <<- inv
  getinv <- function() I
#list containing the functions above  
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

cacheSolve <- function(x, ...) {
#Get inverse if it exists  
  I <- x$getinv()
#If it does exist pull from cached variable
  if(!is.null(I)) {
    message("getting cached inverse")
    return(I)
  }
#Otherwise solve(M) if M is non singular  
  M <- x$get()
#Thanks internet for this method to check if M is singular
if(class(try(solve(M),silent=TRUE))=="matrix") {
  I <- solve(M)
  x$setinv(I)
  I
}
  else {stop("This Matrix is singular") }
}


