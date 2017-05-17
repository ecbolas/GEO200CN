#####################Functionals##########################
##########################################################
#you will notice none of this code is commented. That's 
#because I left it as an exercise for you!



#######################apply()############################

x <- matrix(1:48, nrow=8)

apply(x, 2, sum)



######################lapply()############################

##Example 1
x <- list(a=1:10, b=rnorm(10, 20, 5), 
              c=sample(c(TRUE, FALSE, NA), 10, replace=TRUE))

lapply(x, mean, na.rm=TRUE)

#Example 2
lapply(1:10, function(i) runif(20, min=0, max=i))


#Example 3
y <- data.frame(replicate(8, sample(1:100, 10))) 

lapply(1:nrow(y), function(i) { 
	row <- unlist(y[i,])
	rowmean <- mean(row)
	(row-rowmean)^2/length(row)
})


######################sapply()############################
#What is different between the following two calls of sapply()?

sapply(1:10, function(i) rep(i, 5))

sapply(1:10, function(i) rep(5, i))



######################vapply()############################



vapply(1:4, function(i) (1:4)^i, c(id=0, squared=0, cubed=0, fourth=0))


#################Map() and mapply()#######################

##Example 1: weighted means

xs <- replicate(5, runif(10), simplify = FALSE) #values
ws <- replicate(5, rpois(10, 5) + 1, simplify = FALSE) #weights

Map(weighted.mean, xs, ws)

##Example 2: Matrix multiplication

a <- matrix(1:25, nrow=5)
b <- matrix(26:50, nrow=5)

index <- expand.grid(1:ncol(b), 1:nrow(a))

m <- mapply(function(i,j) {
		sum(a[i,] * b[,j])
	}, index[,1], index[,2])







