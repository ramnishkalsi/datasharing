
Variables
===========
For the purposes of this project, the raw data used was from "Human Activity Recognition Using Smartphones Data Set".

Mean & standard deviation were considered across various paramerters. For details of variables starting with t & f below, please see https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

<pre>
"Activity" - One of six activities - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
"Subject"  - Subject in question - One of 30, as per the dataset.
"tBodyAcc.M.X" 
"tBodyAcc.M.Y" 
"tBodyAcc.M.Z" 
"tBodyAcc.SD.X"
"tBodyAcc.SD.Y" 
"tBodyAcc.SD.Z" 
"tGravityAcc.M.X" 
"tGravityAcc.M.Y" 
"tGravityAcc.M.Z" 
"tGravityAcc.SD.X" 
"tGravityAcc.SD.Y" 
"tGravityAcc.SD.Z" 
"tBodyAccJerk.M.X" 
"tBodyAccJerk.M.Y" 
"tBodyAccJerk.M.Z" 
"tBodyAccJerk.SD.X" 
"tBodyAccJerk.SD.Y" 
"tBodyAccJerk.SD.Z" 
"tBodyGyro.M.X" 
"tBodyGyro.M.Y" 
"tBodyGyro.M.Z" 
"tBodyGyro.SD.X" 
"tBodyGyro.SD.Y" 
"tBodyGyro.SD.Z" 
"tBodyGyroJerk.M.X" 
"tBodyGyroJerk.M.Y" 
"tBodyGyroJerk.M.Z" 
"tBodyGyroJerk.SD.X" 
"tBodyGyroJerk.SD.Y" 
"tBodyGyroJerk.SD.Z" 
"tBodyAccMag.M" 
"tBodyAccMag.SD" 
"tGravityAccMag.M" 
"tGravityAccMag.SD" 
"tBodyAccJerkMag.M" 
"tBodyAccJerkMag.SD" 
"tBodyGyroMag.M" 
"tBodyGyroMag.SD" 
"tBodyGyroJerkMag.M" 
"tBodyGyroJerkMag.SD" 
"fBodyAcc.M.X" 
"fBodyAcc.M.Y" 
"fBodyAcc.M.Z" 
"fBodyAcc.SD.X" 
"fBodyAcc.SD.Y" 
"fBodyAcc.SD.Z" 
"fBodyAccJerk.M.X" 
"fBodyAccJerk.M.Y" 
"fBodyAccJerk.M.Z" 
"fBodyAccJerk.SD.X" 
"fBodyAccJerk.SD.Y" 
"fBodyAccJerk.SD.Z" 
"fBodyGyro.M.X" 
"fBodyGyro.M.Y" 
"fBodyGyro.M.Z" 
"fBodyGyro.SD.X" 
"fBodyGyro.SD.Y" 
"fBodyGyro.SD.Z" 
"fBodyAccMag.M" 
"fBodyAccMag.SD" 
"fBodyBodyGyroMag.M" 
"fBodyBodyGyroMag.SD" 
"fBodyBodyGyroJerkMag.M" 
"fBodyBodyGyroJerkMag.SD"
</pre>

R script
==========
The R script works as below:
* Load & combine  training & test variable data
* Subset the variable data i.e. select the target columns
* Set column names of variable data
* Load & combine training & test observation information
* Replace the numerical observation information with more meaningful information
* Create a master data frame by combining the observation information & variable information
* Use ddply to group over columns - Subject & Activity
* Write the master data frame to a file using write.table

