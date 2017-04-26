##########################################################################
#########################Problem Solving in R#############################
##########################################################################

################Packages#################

library(reshape2)

##################Anatomy of an R help file#######################

?union
?rep
?unique
?lapply
?melt



##################Exploring Code########################
#figure out what each line of code does
set.seed(2212) 

df <- data.frame(replicate(8, round(rnorm(50, 0, 4), 2)))
#rnorm is making a normal distribution of 50 observations with mean=0, SD=4, round it to the second decimal place, replicate that 8 times and make it into a data frame. rnorm is using the set.seed.
#rnorm default mean= 0 because it's used to simulate errors, which is what would show up if there is an error. when generating random data, you can generate a random mean

names(df) <- paste0('run', 1:8)
#now the names of the columns are run1, run2, run3
#paste0 is the same as paste, except there is no longer a space in the names, i.e., paste -> run 1 and paste0 -> run1



x <- apply(unname(df[,3:6]), 1, rep, times=4)
#unname columns 3-6, then apply function takes that goes by row (that's what 1 signifies), then repeats that 4 times



##################Types of Errors########################

#######Syntax Errors######
#find and correct all of the syntax errors in these for lines of code

dfunif <- data.frame(replicate(100, runif(20, 0, 10)))

x <- lapply(1:100, function(i) mean(dfunif[,i])) #i is a argument that will take on different values, depending on the first input of lapply this is creating a function, the input is i, the output is the mean of column i, any number we want between 1 and 100 rows
#lappy give lappy a sequence of numbers, it uses those numbers as inputs to a function that we define. it always returns a list. 1st argument is the sequence of things, 2nd argument is the function, and then we added info on the function. Here the function is the mean of dfunif column i
x

shapiro.test(x) #a test of normality
shapiro.text(runif(100, 0, 10, FALSE))


######Runtime Errors######
#find and correct the runtime errors in this section
#this is what happes when you ask the computer to do something it can't do, like putting a function somewhere it isn't supported
#these become common when writing functions
#sometimes the error occurs in a different place from where the computer gets upset
vector1 <- 1:10
vector2 <- c('cat','whale','horse','owl')

addfive <- function(v) {
    v3 <- v+5
    return(v3)
}

addfive(vector1)
addfive(vector2) #asking to add 5 to non-numeric argument





######Logic Errors########

#where you have written code that is technically correct, but it doesn't do what you thought it would
#sometimes you get numbers, so it's hard to know if it's wrong or not

##Problem 1: extract the numbers in random vector that are between 25 and 75
    #save those numbers as a variable named middle
    
set.seed(32)
randomvector <- sample(1:100, 50)


#####################
#first try
middle <- if (randomvector > 25 & randomvector > 75) {
    randomvector
} else {
    
}
#can't use if/else on a list, needs to be boolean/binary. you can put if/else into lapply to fix

middle2 <- if (randomvector > 25 & randomvector < 75) {
  randomvector
} else {
  
}

#####################
#second try
indexes <- which(randomvector>25 & randomvector<75) #identify which elements the ones we want. I think this doesn't work because it only works with true/false, logical vectors
indexes #this didn't select the correct things

rvorder<- order(randomvector)
rvorder #the problem is that this returns stuff in the order that it was selected, doesn't recognize the actual number values of this list

parameters <- randomvector

middle <- [indexes] #select those elements


##Problem 2: Add 10 to every element of l1 and return as a vector.

l1 <- as.list(sample(1:100, 20))

add10 <- sapply(1:10, function(i) {
    l1[[i]]+10
})

add10 <- sapply(l1[i] +10)

