## cachematrix.R - Caching the Inverse of a Matrix.
#
## This program consists of pair of functions that cache the inverse of a matrix.
#
# First function "makeCacheMatrix" creates a special "matrix", which is really a list
# containing a function to:
#
# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the inverse of the matrix
# 4. Get the inverse of the matrix
#
# To see this list, see below "Output of the command as.list(makeCacheMatrix())"

makeCacheMatrix <- function(x = matrix())
{
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}

# The second function "cacheSolve" calculates the inverse of the special "matrix"
# created with the makeCacheMatrix function above. It first checks to see if the inverse
# of the matrix has already been calculated. If so, it gets the inverse from the cache
# and skips the computation. Otherwise, it calculates the inverse of the matrix and
# sets the inverse matrix in the cache via the setinv function.

cacheSolve <- function(x, ...)
{
        inv = x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}

## testCaching.R function written to test it - see its run below
#
## Output of the command as.list(makeCacheMatrix())
# > as.list(makeCacheMatrix())
# $set
# function (y)
# {
#     x <<- y
#     inv <<- NULL
# }
# <environment: 0x000000000616a490>
#
# $get
# function ()
# x
# <environment: 0x000000000616a490>
#
# $setinv
# function (solve)
# inv <<- solve
# <environment: 0x000000000616a490>
#
# $getinv
# function ()
# inv
# <environment: 0x000000000616a490>
#
## Testing the time taken without and with caching
# > getwd()
# [1] "C:/Data/R-Progs/ProgrammingAssignment2"
# > source("cachematrix.R")
# > source("testCaching.R")
# > set.seed(2370732)
# > r <- rnorm(1000000)
# > mat1 <- matrix(r, nrow=1000, ncol=1000)
# > testCaching(mat1)
# Time taken 0.5730281 secs
# getting cached data
# Time taken 0.0005059242 secs
# >
# #
