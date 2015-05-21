# Merges the training and the test sets to create one data set.
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.create("cleaning")
download.file(url, "cleaning/dataset.zip", method="wget")
unzip("cleaning/dataset.zip")

feat.tra <- read.table("UCI HAR Dataset/train/X_train.txt")
cls.tra <- read.table("UCI HAR Dataset/train/y_train.txt")
sub.tra <- read.table("UCI HAR Dataset/train/subject_train.txt")
feat.tst <- read.table("UCI HAR Dataset/test/X_test.txt")
cls.tst <- read.table("UCI HAR Dataset/test/y_test.txt")
sub.tst <- read.table("UCI HAR Dataset/test/subject_test.txt")

tra <- cbind(feat.tra, cls.tra, sub.tra)
tst <- cbind(feat.tst, cls.tst, sub.tst)
all.data <- data.frame(rbind(tra, tst))

#Extracts only the measurements on the mean and standard deviation for each measurement. 
feat <- read.table("UCI HAR Dataset/features.txt")
idx.feat <- grep("(mean|std)\\(", feat[,2])
data <- all.data[,c(idx.feat, ncol(all.data) - 1, ncol(all.data))]

# Appropriately labels the data set with descriptive variable names. 
labels.feat <- c(as.character(feat[idx.feat,2]), "activity_id", "subject")
names(data) <- labels.feat

#Uses descriptive activity names to name the activities in the data set
act.labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity_name"))
data.labeled <- merge(data, act.labels, by="activity_id", all=TRUE)
data.melt <- melt(data.labeled,id=c("activity_id","activity_name","subject"))

library(reshape2)
final <- dcast(data.melt, subject + activity_id + activity_name ~ variable, mean)
write.table(final, "tidy_final_data.txt", row.name = F)
