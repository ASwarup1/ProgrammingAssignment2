testCaching = function(mat){
        # Parameter mat is an invertible matrix

        mattemp <- makeCacheMatrix(mat)

        starttime <- Sys.time()
        cacheSolve(mattemp)
        calctime <- Sys.time() - starttime
        message("Time taken: ", calctime)

        starttime <- Sys.time()
        cacheSolve(temp)
        calctime <- Sys.time() - starttime
        message("Time taken: ", calctime)
}
