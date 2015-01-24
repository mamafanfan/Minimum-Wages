## read training data
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")
train.id <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.label <- read.table("UCI HAR Dataset/train/y_train.txt")
## read test set
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
test.id <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.label <- read.table("UCI HAR Dataset/test/y_test.txt")

ll <- read.table("UCI HAR Dataset//activity_labels.txt", stringsAsFactor=F)
var.names <- read.table("UCI HAR Dataset//features.txt", stringsAsFactor=F)

## merge train/test set
names(ll) <- c("activity_id", "activity")
names(train.id) <- "subject_id"
names(test.id) <- "subject_id"
names(train.label) <- "activity_id"
names(test.label) <- "activity_id"
names(train.data) <- var.names$V2
names(test.data) <- var.names$V2
train.data <- cbind(train.id, train.label, train.data)
test.data <- cbind(test.id, test.label, test.data)
## 1. merged dataset "dat"
dat <- rbind(train.data, test.data)
dim(dat)
## 2. extract mean() and std()
## create index
ind_mean <- grep("(.*)mean()(.*)", names(dat))
ind_sd <- grep("(.*)std()(.*)", names(dat))
## dataframe "dat.ex" with only mean and sd
ind <- append(ind_mean, ind_sd)
dat.ex <- dat[,c(1:2, ind)]

## 3. replace activity_id with activity names
dat.ex[,"activity_id"] <- factor(dat.ex[,"activity_id"], labels=ll$activity)

## 4. apply labels to col variables
## done already in the beginning
head(names(dat.ex), 4)

## 5. find average of each variable in (4) and for each activity and for each subject
## This should be a df with 180 obs (30 subjects x 6 activities)
library("reshape2")
s <- melt(new.dat, id=(c("subject_id", "activity_id")))
s.1 <- dcast(s, interaction(subject_id, activity_id) ~ variable, mean)
write.table(s.1, file="getdata_project.txt", row.names=FALSE)

