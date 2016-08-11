##The function inverse a matrix

## The first function (makeCacheMatrix()) creates a special list "vector" that contains 
## a function to set and to get the value of the vector, and then to set and to get 
## the inverse of the input matrix (x)

makeCacheMatrix <- function(x = matrix()) {
	hello <-NULL
	set<-function(y){
		x<<-y
		hello <<-NULL
	}
	get<-function()x
	setInverse <-function(inverse) hello<<-inverse
	getInverse <-function() hello
	list(set=set, get=get,
		setInverse = setInverse,
		getInverse = getInverse)
}



## The function below returns the inverse of the matrix (x) created with the function above.
## The function operates as follow:
## 1. check to see if the inverse is created in the above function
## 2a. if step 1 is true, it gets the inversed matrix from the cache and skips the computation
## 2b. if step 1 is false, it creates an inverse of the input matrix and sets the value of the
## matrix in the cache using the setInverse function


cacheSolve <- function(x, ...) {
	hello <- x$getInverse()
	if(!is.null(hello)) {
		message("getting cached data")
		return(hello)
	}
	hi<-x$get()
	hello<-inverse(hi,...)
	x$setInverse(hello)
	hello
}
