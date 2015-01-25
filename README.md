---
title: "README"
author: "ac"
date: "24/01/2015"
output: html_document
--- 
The R codes required to produce the project submission are in "run_analysis.R". It assumes the samsung dataset is in the "UCI HAR Dataset" sub-directory of the working directory in which "run_analysis.R" resides. The original directory structure of the raw data file is preserved as is.

Three new variable names are introduced: "subject_id", "activity_id" and "activity". These represent, respectively, the subject id number in "subject_train.txt"" and "subject_test.txt", the activity number in "y_test.txt" and "y_train.txt", and the activity labels in "activity_labels.txt". Other measaurement variables are assigned labels exactly as shown in "features.txt".

Comments are incoporated in the "run_analysis.R" to show how each code chunk relates to the project questions. Specifically, regular expression is used to extract the relevant mean and standard deviation variables from the activity measurements. Package "reshape2" is used to melt and dcast the dataset in order to produce the mean of each activity for each subject. There are a total of 180 combinations for 30 nos. subjects and 6 nos. activities.

* **"run_analysis.R"** contains all R codes required to produce the submitted results
* **"codebook.Rmd"** describes the variables used in the data analysis
* **"getdata_project.txt"** is the independent tidy dataset that show the average of each variable for each activity and for each subject
* **"features.txt"** came with the raw dataset listing all the measurement variables.

