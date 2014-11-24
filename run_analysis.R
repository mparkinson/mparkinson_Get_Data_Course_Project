# The reshape2 library will be needed for Step 5 in the assignment
# I actually started with the original reshape library, but through Stack Overflow identified that reshape2 is much more efficient
library("reshape2")

xTrain <- read.table("train/X_train.txt") # Creating xTrain object
xTest <- read.table("test/X_test.txt")  # Creating xTest object
xData <- rbind(xTrain, xTest) # Creating xData object by joining xTrain and xTest
yTrain <- read.table("train/y_train.txt") # Creating the yTrain object
yTest <- read.table("test/y_test.txt")  # Creating the yTest object
yData <- rbind(yTrain, yTest) # Creating yData object by joining yTrain and yTest, similar to what we did with xData
subjectTrain <- read.table("train/subject_train.txt") # Creating the subjectTrain object
subjectTest <- read.table("test/subject_test.txt")  # Creating the subjectTest object
subjectData <- rbind(subjectTrain, subjectTest) # Creating subjectData in the same pattern as xData and yData

features <- read.table("features.txt")[,2]  # We only need the names from the features table
activityLabels <- read.table("activity_labels.txt")[,2] # Like with features, only the second column is needed

# Extract only the items in features with mean() or std() in the name
subsetFeatures <- grep("mean\\(\\)|std\\(\\)",features, value = TRUE)

# Assign the column names from the features table to xData
colnames(xData) <- subsetFeatures

# Append an additional column to label the activity, similar to VLOOKUP in Excel
yData[,2] = activityLabels[yData[,1]]

# Name the columns in yData something useful
colnames(yData) <- c("Activity_Number", "Measured_Activity")

# Name the column in subjectData something useful
colnames(subjectData) <- "Subject"

# Combine all data, with subject data followed by activities followed by measurement data
combiner <- cbind(subjectData, yData, xData)

# Melting the data.  This task will reduce the number of columns to create distinct row combinations (like a primary key) featuring measurements
# Note that the 3 identified ID labels match first 3 columns in the 'combiner' object
meltedCombiner <- melt(combiner, id=c("Subject", "Activity_Number", "Measured_Activity"))

# The original function I worked with was cast, but dcast is a quicker way to do it
dCastCombiner <- dcast(meltedCombiner, Subject + Activity_Number + Measured_Activity ~ variable, fun.aggregate = mean)

# Write the tidy data to a file called "cleanedData.txt"
write.table(dCastCombiner, file = "cleanedData.txt", row.name = FALSE)