## Coursera: Getting and Cleaning Data: Course Project
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## download the archive if it does not exist
archive = "getdata-projectfiles-UCI HAR Dataset.zip"
if( ! file.exists(archive) )
{
    # download the archive
    print(paste0("downloading [", archive, "]"))
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", archive, mode = "wb")
}

## Load Files from Archive
# measurements - column headers
features <-read.table(unz(archive, "UCI HAR Dataset/features.txt"), col.names = c("Id", "Measurement"), stringsAsFactors = FALSE)
colnames <- gsub("\\(\\)", "", features$Measurement, perl = TRUE)
rm(features)

# activity description
activities <- read.table(unz(archive, "UCI HAR Dataset/activity_labels.txt"), col.names = c("Id", "Activity"), quote = "", stringsAsFactors = FALSE)

# factors - measurements
xTest <- read.table(unz(archive, "UCI HAR Dataset/test/X_test.txt"), col.names = colnames)
xTrain <- read.table(unz(archive, "UCI HAR Dataset/train/X_train.txt"), col.names = colnames)

subjectTest <- read.table(unz(archive, "UCI HAR Dataset/test/subject_test.txt"), col.names = "Subject")
subjectTrain <- read.table(unz(archive, "UCI HAR Dataset/train/subject_train.txt"), col.names = "Subject")

# activities being performed
yTest <- read.table(unz(archive, "UCI HAR Dataset/test/y_test.txt"), col.names = "Activity")
yTrain <- read.table(unz(archive, "UCI HAR Dataset/train/y_train.txt"), col.names = "Activity")

## Merge the training and the test sets to create one data set
x <-rbind(xTrain, xTest)
y <-rbind(yTrain, yTest)
subjects <-rbind(subjectTrain, subjectTest)

rm(xTrain, xTest, yTrain, yTest, subjectTrain, subjectTest)

## Extract only the measurements on the mean and standard deviation for each measurement
xAvg <- x[, grep("-mean|-std", colnames, perl = TRUE)]
rm(x)

# Use descriptive activity names to name the activities in the data set
Activity <-factor(y$Activity, labels = activities$Activity)
rm(y)

Subject <- factor(subjects$Subject)
rm(subjects)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
avgDataset <- aggregate(xAvg, by = list(Activity, Subject), FUN = mean)

# rename the grouping columns
colnames(avgDataset)[1] = "Activity"
colnames(avgDataset)[2] = "Subject"

write.table(avgDataset, file = "MeanDataSet.txt", quote = FALSE, row.names = FALSE)
