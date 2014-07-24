### Tests got cachematrix.R
### Run in in a R shell:
### > source("cachematrix_test.R")
### [1] "Tests are OK!"
### If you see "Tests are OK!", then the code works!
###

# load the code
source("cachematrix.R")

# initiate the matrix
mm <- makeCacheMatrix(matrix(3:6, 2))

# catch messages and send it to a file
zz <- file("messages.tmp", "w")
sink(zz, type = "message")

# solve
result <- cacheSolve(mm)
if (result != matrix(c(-3, 2, 2.5, -1.5), 2)) {
    stop("unexpected solve result!")
}

# solve again
result <- cacheSolve(mm)
if (result != matrix(c(-3, 2, 2.5, -1.5), 2)) {
    stop("unexpected solve result from cache!")
}

msgs <- read.csv("messages.tmp", header=FALSE)
if (length(msgs) != 1) {
    stop("error parsing messages from cacheSolve")
}

if (msgs[[1]] != "returning cached inverse") {
    stop("error checking the message");
}

print("Tests are OK!")
