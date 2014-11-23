For the project reviewer, please note that I have elected to take features_info and activity_labels and replicate them, with modifications for the data included toward the end of the file.  I believe this is the most straight-forward way to describe the data.  Please note that the README.md file will be more useful than this file for users interested in following the code process.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The Activity Number and Names (column names provided below) are:

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


The tidy data set works with the signals, variables, and activiies described above.  It also pulls in the Subject field from related data sets.

The data presented is:
Subject - A subject number to identify the participant
Activity_Number - Describes the activity number.  I elected to leave Activity Number in place because I prefer working with numbers over names.
Measured_Activity - A description of the activity
The fields that follow are the average of the mean and standard deviation for the fields listed above.  They contain names such as tBodyAcc-mean()-X, indicating that the field is the average of the mean for the tBodyAccess test.

Consequently, the tidy data set is a summarized version of the test data provided.  It provides averages of means and standard deviations for each test for each subject-activity pairing.  It is not a comprehensive list of all data in the original data set.