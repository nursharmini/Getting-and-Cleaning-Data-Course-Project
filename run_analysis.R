# The following steps is performed based on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#To create one R script called run_analysis.R that does the following:
#
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##################################################################################

# Read data from the files into the variables

## i. Read the activity files

f_path <- file.path("./data", "UCI HAR Dataset")
dataActivityTest  <- read.table(file.path(f_path, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(f_path, "train", "Y_train.txt"),header = FALSE)

## ii. Read the Subject files

dataSubjectTrain <- read.table(file.path(f_path, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(f_path, "test" , "subject_test.txt"),header = FALSE)

## iii. Read the Fetures files

dataFeaturesTest  <- read.table(file.path(f_path, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(f_path, "train", "X_train.txt"),header = FALSE)


# 1. Merge the training and test sets to create one data set.
###############################################################################

## i. Concatenate the data tables by rows

dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

## ii. Set names to variables

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(f_path, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2


## iii. Merge column to get the data frame for all data

dataMerge <- cbind(dataSubject, dataActivity)
View(dataMerge) # to view merged data of Subject and Activity

Data <- cbind(dataFeatures, dataMerge)
View(Data) # to view merged data of Subject, Activity and Features

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
###############################################################################

## i. Subset name of Features by measurements on the mean and standard deviation 
#### with mean() or std()

subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

## ii. Subset the data frame Data by selected names of features

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

str(Data) # to check the structure of the data frame Data

# 3. Use descriptive activity names to name the activities in the data set
###############################################################################

## i. Read descriptive activity names from "activity_label.txt"

activityLabels <- read.table(file.path(f_path, "activity_labels.txt"), header=FALSE)


## ii. Factorize variable activity in the data frame Data by using descriptive activity names 

Data$activity <- factor(Data$activity, labels = activityLabels[,2])

## check the factorized variable
head(Data$activity,30)
View(Data)



# 4. Appropriately label the data set with descriptive activity names. 
###############################################################################

###### names of features will be labeled using descriptive variable names.

names(Data)<-gsub("^t", "time", names(Data)) # prefix t is replaced by time
names(Data)<-gsub("^f", "frequency", names(Data)) # prefix f is replaced by frequency
names(Data)<-gsub("Acc", "Accelerometer", names(Data)) # Acc is replaced by Accelerometer
names(Data)<-gsub("Gyro", "Gyroscope", names(Data)) #Gyro is replaced by Gyroscope
names(Data)<-gsub("Mag", "Magnitude", names(Data)) #Mag is replaced by Magnitude
names(Data)<-gsub("BodyBody", "Body", names(Data)) #BodyBody is replaced by Body

## check the replacement made
names(Data)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
###############################################################################

### indipendent tidy data set will be created with the average of each variable for each activity and each subject based on the data set in step 4.

library(plyr)
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)



