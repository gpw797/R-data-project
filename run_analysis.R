library("plyr")
#Getting and cleaning data project
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile(tmpdir = tempdir())
#download File
download.file(url, temp, method="auto")
#unzip file in project directory
if(!file.exists("./project")){dir.create("./project")}
unzip(temp, exdir = "./project")
#terminate con to temp
unlink(temp)
testtrainmerge = data.frame()
#get txt files into r format
subject_test <- read.table("./project/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./project/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./project/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./project/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./project/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./project/UCI HAR Dataset/train/y_train.txt")
#merge data
testmerge <- cbind(subject_test, y_test, X_test)
trainmerge <- cbind(subject_train, y_train, X_train)
testtrainmerge <- rbind(testmerge, trainmerge)
#create vector for column names 
mycolnames <- read.table("./project/UCI HAR Dataset/features.txt", header = F)
mycolnames <- as.character(mycolnames[,2])
mycolnames <- c("individual", "activity", mycolnames)
#add column names to merged set with character vector
colnames(testtrainmerge) <- mycolnames
#subset complete data.frame for just the columns that that are mean and std dev step 2
subcols <- c(grep("individual", mycolnames), grep("activity", mycolnames), grep("mean()", mycolnames), grep("std()", mycolnames))  
mysubset <- testtrainmerge[,subcols]
#swap activity names for activity numbers step 3
mysubset$activity <- as.character(mysubset$activity)
mysubset$activity[mysubset$activity == "1"] <- "WALKING"
mysubset$activity[mysubset$activity == "2"] <- "WALKING_UPSTAIRS"
mysubset$activity[mysubset$activity == "3"] <- "WALKING_DOWNSTAIRS"
mysubset$activity[mysubset$activity == "4"] <- "SITTING"
mysubset$activity[mysubset$activity == "5"] <- "STANDING"
mysubset$activity[mysubset$activity == "6"] <- "LAYING"
#Appropriate labels with descriptive variable names step 4
#change to all lower case per lecture - Editing Text Variables - week 4
names(mysubset) <- tolower(names(mysubset))
#Create a second data set avg of each variable for each activity & each subject step 5
mysubset[,2] <- sapply(mysubset[,2], as.factor) 
aggdata <- aggregate(mysubset[,3:81], by=list(mysubset$activity, mysubset$individual), FUN=mean, na.rm=T)
#substitute original names back in for aggregate grouping names
names(aggdata) <- sub("Group.2","individual",names(aggdata))
names(aggdata) <-sub("Group.1","activity",names(aggdata))
#write tidy data as a file to same project directory. File format is comma deliminated txt
write.table(aggdata, "./project/tidydata.txt", sep=",", row.name=FALSE)
