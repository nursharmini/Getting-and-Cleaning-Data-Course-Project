# Getting-and-Cleaning-Data-Course-Project
This repository is for the submission of the course project for Getting and Cleaning Data Module. 

# Overview
The purpose of this project is to prepare tidy data that can be used for later analysis. The purpose of this course project is to produce a tidy data set from the files provided . 

A full description of the data used in this project can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

Data of the project can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

# Project Goal
R script named run_analysis.R is created to do the following.
* Merte the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the acivities in the data set.
* Appropriately label the data set with descriptive activity names.
* From the data set in step above, create a second, independent tidy data set with the average of each variable for each activity and each subject.
   
# Steps to prepare tidy data
## Step 1 : Get the data
* Download the file and put the file in the data folder
* Unzip the file
* Place the unzipped files in folder UCI HAR Dataset

## Step 2 : Read data from targeted files
* Get the big picture of the structure of the data that will be used in this project
* Read data from the files into the variables
* Look at the properties of the above variables

## Step 3 : Perform the analysis as instructed
### Merge the training and the test sets to create one data set
Firstly, concatenate the data tables by rows then set names to variables. Finally, merge column to get the data frame Data for all data

### Extract only the measurements on the mean and standard deviation for each measurement
Firstly, subset name of Features by measurements on the mean and standard deviation, then subset the data frame Data by seleted names of Features and finally check the structures of the data frame Data.

### Use descriptive activity names to name the acivities in the data set
Firstly, read descriptive activity names from "activity_labels.txt" file, then factorize variable activity in the data frame Data using descriptive activity names. 

### Appropriately label the data set with descriptive activity names
This part will label the name of the Features using descriptive variable names.
•	prefix t is replaced by time
•	Acc is replaced by Accelerometer
•	Gyro is replaced by Gyroscope
•	prefix f is replaced by frequency
•	Mag is replaced by Magnitude
•	BodyBody is replaced by Body

### Create a second, independent tidy data set with the average of each variable for each activity and each subject
In this part,a second, independent tidy data set will be created ("tidydata.txt") with the average of each variable for each activity and each subject based on the data set in step above.

# About the script
The commands which were used to produce the tidy set, as well as corresponding comments, are stored in "run_analysis.R" file". This R script can be viewed in this same repo.

