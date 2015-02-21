# six activities (WALKING, , , , , ) 

analyse <- function(){
  
  #Load & combine the data sets into variables.
  trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
  testSet   <- read.table("./UCI HAR Dataset/test/X_test.txt")
  combinedSet <- rbind(trainingSet, testSet)
  
  # Extracts only the measurements on the mean and standard deviation for each measurement. 
  dataSubset <- select(combinedSet, 1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 529:530, 542:543)

  # add column names to the dataset
  colnames(dataSubset) <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X","tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z","tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()","tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()","tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()","tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()")
  

  # Load & combine the observation information
   trainingY <- read.table("./UCI HAR Dataset/train/y_train.txt")
   testY   <- read.table("./UCI HAR Dataset/test/y_test.txt")
   combinedY <- rbind(trainingY, testY)
  
  # Set the colname for the observation information.
  colnames(combinedY) <- c("Activity") 
  
  #Replace activity lables with actual values
  combinedY$Activity[combinedY$Activity == "1"] <- "WALKING"
  combinedY$Activity[combinedY$Activity == "2"] <- "WALKING_UPSTAIRS"
  combinedY$Activity[combinedY$Activity == "3"] <- "WALKING_DOWNSTAIRS"
  combinedY$Activity[combinedY$Activity == "4"] <- "SITTING"
  combinedY$Activity[combinedY$Activity == "5"] <- "STANDING"
  combinedY$Activity[combinedY$Activity == "6"] <- "LAYING"
  
  
  # Combine the data frames.
  df <- data.frame(combinedY, dataSubset)
  
  # Write the values to a file.
  write.table(df, file="har_data.txt", row.names=FALSE) 
  
  
}