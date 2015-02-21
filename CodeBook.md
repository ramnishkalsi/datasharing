
Variables
===========
For the purposes of this project, the raw data used was from "Human Activity Recognition Using Smartphones Data Set".

Mean & standard deviation were considered from following signals:

<pre>
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
</pre>

R script
==========
The R script works as below:
* Load & combine  training & test variable data
* Subset the variable data i.e. select the target columns
* Add column names to the variable data
* Load & combine training & test observation information
* Set column name for observation information
* Replace the numerical observation information with more meaningful information
* Create a master data frame by combining the observation information & variable information
* Write the master data frame to a file using write.table

