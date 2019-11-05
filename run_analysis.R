library(data.table)

# 0. load test and training sets and the activities
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")

# 3. Uses descriptive activity names to name the activities in the data set
y_test$V1 <- factor(y_test$V1,levels=activity_labels$V1,labels=activity_labels$V2)
y_train$V1 <- factor(y_train$V1,levels=activity_labels$V1,labels=activity_labels$V2)

# 4. Appropriately labels the data set with descriptive activity names
colnames(X_test)<-features$V2
colnames(X_train)<-features$V2
colnames(y_test)<-c("Activity")
colnames(y_train)<-c("Activity")
colnames(sub_test)<-c("Subject")
colnames(sub_train)<-c("Subject")

# 1. merge test and training sets into one data set, including the activities
X_test<-cbind(X_test,y_test)
X_test<-cbind(X_test,sub_test)
X_train<-cbind(X_train,y_train)
X_train<-cbind(X_train,sub_train)
bigData<-rbind(X_test,X_train)

# 2. extract only the measurements on the mean and standard deviation for each measurement
bigData_mean<-sapply(bigData,mean,na.rm=TRUE)
bigData_sd<-sapply(bigData,sd,na.rm=TRUE)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
DT <- data.table(bigData)
tidy<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy.txt",sep=",",row.names = FALSE)
