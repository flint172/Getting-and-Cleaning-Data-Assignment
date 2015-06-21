
##Load zip file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
x_test <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
y_test <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
sub_test <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
x_train <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
sub_train <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
unlink(temp)

test_total <- x_test
test_total[,"subject"] <- sub_test
test_total[,"y"] <- y_test

train_total <- x_train
train_total[,"subject"] <- sub_train
train_total[,"y"] <- y_train

total <- merge(test_total, train_total)