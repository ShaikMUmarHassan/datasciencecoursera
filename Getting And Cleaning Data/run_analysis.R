library(reshape2)

# Download the dataset
datasetfile<- "dataset.zip"
if (!file.exists(datasetfile)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, datasetfile, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(datasetfile) 
}

# Load the features
features <- read.table("./UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Load the activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

# Extract vector of data having only mean and standard deviation
featuresExtracted <- grep(".*mean.*|.*std.*", features[,2])
featuresExtracted.names <- features[featuresExtracted,2]

# Make the Names Tidy 
featuresExtracted.names = gsub('-mean', 'Mean', featuresExtracted.names)
featuresExtracted.names = gsub('-std', 'Std', featuresExtracted.names)
featuresExtracted.names <- gsub('[-()]', '', featuresExtracted.names)

# Load all train data
train <- read.table("./UCI HAR Dataset/train/X_train.txt")[featuresExtracted]
trainActivities <- read.table("./UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Column Merge all train data sets
Alltrain <- cbind(trainSubjects, trainActivities, train)

# Load all test data
test <- read.table("./UCI HAR Dataset/test/X_test.txt")[featuresExtracted]
testActivities <- read.table("./UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Column Merge all test data sets
Alltest <- cbind(testSubjects, testActivities, test)

# Merge the whole train and test datasets and give lables
FinalData <- rbind(Alltrain, Alltest)
colnames(FinalData) <- c("subject", "activity", featuresExtracted.names)

# turn activities & subjects into factors
FinalData$activity <- factor(FinalData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
FinalData$subject <- as.factor(FinalData$subject)

FinalData.melted <- melt(FinalData, id = c("subject", "activity"))
FinalData.mean <- dcast(FinalData.melted, subject + activity ~ variable, mean)

# Writing all the processed data in a new file
write.table(FinalData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)