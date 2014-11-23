==================================================================
Getting and Cleaning Data - Coursera
Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD, Instructors
==================================================================
Matthew Parkinson, Coursera Student
==================================================================

The Course Project for the Getting and Cleaning Data course on Coursera invited students to work through a complex assimilation and reorganization of data.

Descriptions of the original data may be found here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data itself may be found here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Please note that there is an associated codebook.MD file which describes the variables ultimately submitted with the project's tidy data set.

The instructions for the project were:

 You should create one R script called run_analysis.R that does the following. 

    	1.	Merges the training and the test sets to create one data set.
    	2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
    	3.	Uses descriptive activity names to name the activities in the data set
    	4.	Appropriately labels the data set with descriptive variable names. 
    	5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code file (run_analysis.R) is heavily commented to ease readability.  I also used easily understandable object names to assist readers.

To that end, I followed these basic steps:
	1.	Read in xTrain and xData and merge them into a file called xData
	2.	Read in yTrain and yTest and merge them into a file called yData
	3.	Read in subjectTrain and subjectTest and merge them into a file called subjectData
	4.	Read in the population of features data and write to an object called features
	5.	Obtain activity names from the activity labels file
	6.	Subset the features to only include items that contain either "mean()" or "std()" using the grepl function
		-For this project, there were various interpretations of what constituted mean and std.  I believe mean() and std() were the tester's intent, so I elected to focus on those.
	7.	Apply the activity labels next to the activity number in the yData file
		-My guess is that many people are writing over the activity numbers in yData.  That is a fine solution as well, but I left them in because I generally prefer working with numbers over strings.
	8.	Apply useful usernames to subjectData and yData so that they are easier to read for users.
	9.	Use cBind to combine subjectData, yData, and xData.  We now have one data set featuring results for all tests performed by subject and activity.
	10.	Melt all data into an object called meltedCombiner, keeping subject and actvitiy combinations intact.
	11.	Recombine data into an object called dCastCombiner using the dCast function.  This operation provides a mean for all fields by subject and activity.
	12.	Write the data to a file called "cleanedData.txt"

Please note that the application works through a significant chunk of data.  It may take a couple minutes to process.

I hope this README and the comments in the code prove useful!	