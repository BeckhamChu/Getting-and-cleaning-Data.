# Getting and Cleaning Data Course Project

## Project Description
This project uses data collected from the accelerometers of the Samsung Galaxy S smartphone.
The purpose of the project is to demonstrate the ability to collect, clean, and tidy a data set
that can be used for further analysis.

The original data come from the UCI Machine Learning Repository:
Human Activity Recognition Using Smartphones Dataset.

## Files in this Repository
- Run_analysis.R: R script that performs all data cleaning and transformation steps.
- tidy_dataset.txt: Final tidy data set with the average of each variable for each activity and each subject.
- README.md: This file, explaining the project and how it works.
- CodeBook.md: Describes the variables and transformations used in the project.

## How the Script Works
The Run_analysis.R script performs the following steps:
1. Merges the training and test data sets into one data set.
2. Extracts only the measurements on the mean and standard deviation.
3. Uses descriptive activity names to label the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable
   for each activity and each subject.

## How to Run the Script
1. Place the folder "UCI HAR Dataset" in the same directory as Run_analysis.R.
2. Run the script using:
   source("Run_analysis.R")
3. The output file tidy_dataset.txt will be created in the working directory.
