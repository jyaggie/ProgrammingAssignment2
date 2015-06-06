

##Few comments on the implementation

*The following code creates a list of functions to manipulate a matrix and a function for caching the inverse
*I have test runs at the bottom of this file.  
*Note also I did not test that setinv() worked outside the functions, because I felt logically it should not be called outside.
*I misunderstood and thought we could assume we were given a square matrix, which meant it could still be singular.  Therefore, I added checking for singular matrices and tested it.  Seems a waste to remove it.

##The following is an example test run I did


> W<-matrix(rnorm(16),nrow=4, ncol=4)
> B<-makeCacheMatrix(W)
> B$get()
           [,1]       [,2]        [,3]         [,4]
[1,]  0.4257318 -0.9244867 -0.16552750  1.604811419
[2,]  1.1496251  1.5565732  2.79223779  0.452505518
[3,] -0.2194510 -0.1387960 -0.84510974  0.005523087
[4,]  0.8210070 -1.2386992 -0.01466484 -0.494711999
> B$set(W*25)
> B$get()
          [,1]      [,2]        [,3]        [,4]
[1,] 10.643295 -23.11217  -4.1381875  40.1202855
[2,] 28.740628  38.91433  69.8059448  11.3126380
[3,] -5.486274  -3.46990 -21.1277435   0.1380772
[4,] 20.525174 -30.96748  -0.3666209 -12.3678000
> cacheSolve(B)
              [,1]         [,2]         [,3]         [,4]
[1,] -0.0005502214  0.034507196  0.113580613  0.031046367
[2,] -0.0085086820  0.022107876  0.074824415 -0.006544479
[3,]  0.0016732364 -0.012576481 -0.089088794 -0.007070262
[4,]  0.0203419852  0.002284302  0.003784028 -0.012735473
> B$getinv()
              [,1]         [,2]         [,3]         [,4]
[1,] -0.0005502214  0.034507196  0.113580613  0.031046367
[2,] -0.0085086820  0.022107876  0.074824415 -0.006544479
[3,]  0.0016732364 -0.012576481 -0.089088794 -0.007070262
[4,]  0.0203419852  0.002284302  0.003784028 -0.012735473
> S<-makeCacheMatrix(matrix(1:16, nrow=4, ncol=4))
> S$get()
     [,1] [,2] [,3] [,4]
[1,]    1    5    9   13
[2,]    2    6   10   14
[3,]    3    7   11   15
[4,]    4    8   12   16
> cacheSolve(S)
Error in cacheSolve(S) : This Matrix is singular
