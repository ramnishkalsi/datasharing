# six activities (WALKING, , , , , ) 

analyse <- function(){
  library(plyr)
  library(dplyr)
  #Load & combine the data sets into variables.
  trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
  testSet   <- read.table("./UCI HAR Dataset/test/X_test.txt")
  combinedSet <- rbind(trainingSet, testSet)
  
  # Extracts only the measurements on the mean and standard deviation for each measurement. 
  dataSubset <- select(combinedSet, 1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 529:530, 542:543)

  # add column names to the dataset
  colnames(dataSubset) <- c("tBodyAcc-M-X", "tBodyAcc-M-Y", "tBodyAcc-M-Z", "tBodyAcc-SD-X","tBodyAcc-SD-Y","tBodyAcc-SD-Z","tGravityAcc-M-X","tGravityAcc-M-Y","tGravityAcc-M-Z","tGravityAcc-SD-X","tGravityAcc-SD-Y","tGravityAcc-SD-Z","tBodyAccJerk-M-X","tBodyAccJerk-M-Y","tBodyAccJerk-M-Z","tBodyAccJerk-SD-X","tBodyAccJerk-SD-Y","tBodyAccJerk-SD-Z","tBodyGyro-M-X","tBodyGyro-M-Y","tBodyGyro-M-Z","tBodyGyro-SD-X","tBodyGyro-SD-Y","tBodyGyro-SD-Z","tBodyGyroJerk-M-X","tBodyGyroJerk-M-Y","tBodyGyroJerk-M-Z","tBodyGyroJerk-SD-X","tBodyGyroJerk-SD-Y","tBodyGyroJerk-SD-Z","tBodyAccMag-M","tBodyAccMag-SD","tGravityAccMag-M","tGravityAccMag-SD","tBodyAccJerkMag-M","tBodyAccJerkMag-SD","tBodyGyroMag-M","tBodyGyroMag-SD","tBodyGyroJerkMag-M","tBodyGyroJerkMag-SD","fBodyAcc-M-X","fBodyAcc-M-Y","fBodyAcc-M-Z","fBodyAcc-SD-X","fBodyAcc-SD-Y","fBodyAcc-SD-Z","fBodyAccJerk-M-X","fBodyAccJerk-M-Y","fBodyAccJerk-M-Z","fBodyAccJerk-SD-X","fBodyAccJerk-SD-Y","fBodyAccJerk-SD-Z","fBodyGyro-M-X","fBodyGyro-M-Y","fBodyGyro-M-Z","fBodyGyro-SD-X","fBodyGyro-SD-Y","fBodyGyro-SD-Z","fBodyAccMag-M","fBodyAccMag-SD","fBodyBodyGyroMag-M","fBodyBodyGyroMag-SD","fBodyBodyGyroJerkMag-M","fBodyBodyGyroJerkMag-SD")
  
  subjectsTrain <-  read.table("./UCI HAR Dataset/train/subject_train.txt")
  subjectsTest <-   read.table("./UCI HAR Dataset/test/subject_test.txt")
  subjects <-       rbind(subjectsTrain, subjectsTest)

  colnames(subjects) <- c("Subject")
  
#   print(nrow(subjects))
#   print(nrow(dataSubset))
  
  df1 <- data.frame(subjects, dataSubset)

  # Load & combine the observation information
   trainingY <-     read.table("./UCI HAR Dataset/train/y_train.txt")
   testY   <-       read.table("./UCI HAR Dataset/test/y_test.txt")
   combinedY <-     rbind(trainingY, testY)
  
  # Set the colname for the observation information.
  colnames(combinedY) <- c("Activity")
  
  # Replace activity labels with actual values
  combinedY$Activity[combinedY$Activity == "1"] <- "WALKING"
  combinedY$Activity[combinedY$Activity == "2"] <- "WALKING_UPSTAIRS"
  combinedY$Activity[combinedY$Activity == "3"] <- "WALKING_DOWNSTAIRS"
  combinedY$Activity[combinedY$Activity == "4"] <- "SITTING"
  combinedY$Activity[combinedY$Activity == "5"] <- "STANDING"
  combinedY$Activity[combinedY$Activity == "6"] <- "LAYING"
  
  # Combine the data frames.
  df <- data.frame(combinedY, df1)
  print(colnames(df))  

  # Set up inputs for ddply
  groupColumns = c("Subject","Activity")
  dataColumns = colnames(df1)
  
  res = ddply(df, groupColumns, function(x) colMeans(x[dataColumns]))
  
  # Write the values to a file.
   write.table(res, file="runAnalysis_output.txt", row.names=FALSE)   
}