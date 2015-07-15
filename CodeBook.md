# Overview
The purpose of this project is to prepare tidy data that can be used for later analysis. The purpose of this course project is to produce a tidy data set from the files provided .

A full description of the data used in this project can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Data of the project can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
* The six activities as in activity_labels.txt file

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
* Infomation of data set for features are as in features.txt and features_info.txt file
* Information of data set for training are as in subject_train.txt, X_train.txt and y_train.txt file
* Informatio of data set for testing are as in subject_test.txt, X_test.txt and y_test.txt file

## Variables Information
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
* dataSubject, dataActivity and dataFeatures are merge the previous datasets to further analysis.
* subdataFeaturesNames is subset name of Features by measurements on the mean and standard deviation.
* Data is subset the data frame Data by selected names of features like subject and activity
* activityLabels as descriptive activity names from "activity_label.txt" for column (header) in Data
* names(Data) is appropriately label the data set with descriptive activity names
* Data2 is independent tidy data set with the average of each variable for each activity and each subject.

## Description of experimental design
### Script Information Summary

The script run_analysis.R performs the 5 steps as instructed in the course project's definition.

* Merge the training and test sets to create one data set
Concatenate the data tables by rows using rbind
Set names to variables using names(dataSubject)<-c("subject"), names(dataActivity)<- c("activity") and names(dataFeatures)<- dataFeaturesNames$V2
Merge column to get the data frame for all data using cbind

* Extract only the measurements on the mean and standard deviation for each measurement
Subset name of Features by measurements on the mean and standard deviation with mean() or std()
Subset the data frame Data by selected names of features

* Use descriptive activity names to name the activities in the data set
Read descriptive activity names from "activity_label.txt"
Factorize variable activity in the data frame Data by using descriptive activity names using factor()

* Appropriately label the data set with descriptive activity names
Names of features will be labeled using descriptive variable names in names(Data)

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject
write.table(Data2, file = "tidydata.txt",row.name=FALSE)

