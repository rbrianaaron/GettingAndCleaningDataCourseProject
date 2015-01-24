#Import libraries
library(dplyr)

#1. Merge the training and the test sets to create one data set.This will be acheived by
# first creating three interim data frames, cleaning each, and then merging them.
# The actual merge to create the one data set is in line 95 below.

#Read each text file into dataframe.
#NOTE The original files were in my working directory.
subject.test.df <-    read.table("~\\UCI HAR Dataset\\test\\subject_test.txt")
x.test.df <-          read.table("~\\UCI HAR Dataset\\test\\x_test.txt")
y.test.df <-          read.table("~\\UCI HAR Dataset\\test\\y_test.txt")
subject.train.df <-   read.table("~\\UCI HAR Dataset\\train\\subject_train.txt")
x.train.df <-         read.table("~\\UCI HAR Dataset\\train\\x_train.txt")
y.train.df <-         read.table("~\\UCI HAR Dataset\\train\\y_train.txt")
activity.labels.df <- read.table("~\\UCI HAR Dataset\\activity_labels.txt")
features.df <-        read.table("~\\UCI HAR Dataset\\features.txt")

#Bind x.train.df and x.test.df into x.df, an interm data frame to be cleaned.
x.df <- rbind(x.train.df, x.test.df)

#Bind subject.train.df and subject.test.df into subject.df, an interm data frame.
subject.df <- rbind(subject.train.df, subject.test.df)

#Bind y.train.df and y.test.df into y.df, an interm data frame.
y.df <- rbind(y.train.df, y.test.df)

#2. Extract only the measurements on the mean and standard deviation for each measurement.

#Clean features.df to remove () and - in accordance with Google style guide standards.

features.df$V2 <- gsub('\\(', '', features.df$V2)
features.df$V2 <- gsub('\\)', '', features.df$V2)
features.df$V2 <- gsub('-', '.', features.df$V2)

#Replace variable names in x.df (V1,V2, etc.) with names from features.df names.
colnames(x.df) <- features.df[,2]

#Remove duplicated columns from x.df.
dups <- duplicated(names(x.df))
x.df <- x.df[,!dups]

#Remove non-mean and non-sd columns that is leave all columns that contain the words mean and std.
#First, create one dataframe with only means and one with only stds and they put them back together.

x.a.df <- select(x.df, contains('mean'))
x.b.df <- select(x.df, contains('std'))
x.df <- cbind(x.a.df, x.b.df)

#3. Use descriptive activity names to name the activities in the data set.

#Change activity numbers in y.df to activity names by first creating an ordered vector of the names.
activity.vector <- ifelse(y.df == 1, 'walking',
                          ifelse(y.df==2, 'walking.upstairs',
                                 ifelse(y.df==3, 'walking.downstairs',
                                        ifelse(y.df==4, 'sitting',
                                               ifelse(y.df==5, 'standing',
                                                      ifelse(y.df==6, 'laying', 'snoozing'))))))

#Add activity.vector that contains the activiyt names to y.df.

y.df$activity <- activity.vector

#4. Appropriately label the data set with descriptive variable names. 

#Make x.df column names (the old features names) Google style guide compliant that is all lower case with periods.
names.vector <- names(x.df)
names.vector <- gsub(',','.',names.vector)
names.vector <- gsub('tBody', 'time.body.', names.vector)
names.vector <- gsub('Acc','accel.', names.vector)
names.vector <- gsub('tGravity','time.gravity.', names.vector)
names.vector <- gsub('Jerk','jerk.', names.vector)
names.vector <- gsub('Gyro','gyro.', names.vector)
names.vector <- gsub('Mag','magnitude.', names.vector)
names.vector <- gsub('fBody','fft.body.', names.vector)
names.vector <- gsub('meanFreq', 'mean.freq.', names.vector)
names.vector <- gsub('Mean', 'mean.', names.vector)
names.vector <- gsub('Body', 'body.', names.vector)
names.vector <- gsub('gravity', 'gravity.', names.vector)
names.vector <- gsub('gravitymean', 'gravity.mean.', names.vector)
names.vector <- gsub('X','x', names.vector)
names.vector <- gsub('Y','y', names.vector)
names.vector <- gsub('Z','z', names.vector)
names.vector <- gsub('\\.\\.','.', names.vector)
names.vector <- gsub('\\. ', '', names.vector)

#Replace column names in x.df with newly formatted names.vector.
colnames(x.df) <- names.vector

#Add a column name to subject.df before binding.
names(subject.df) <- 'subject.id'

#Bind x.df, subject.df, y.df to form data.df. (This corresponds to the first requirement of the assignment.)

data.df <- cbind(x.df, subject.df, y.df)

#Remove the V1 column that contains the activity number (part of y.df)
data.df$V1 <- NULL

#5. Create a second, independent tidy data set with the average of each variable for 
#each activity and each subject.
#There will be 180 rows (30 particpants * 6 activities).
#There will be 88 columns (2 fixed variables + 86 measured observations). 

#Group data.df first by the subject id and then by the acitivity description
data.df <- group_by(data.df, subject.id, activity)

#Create the final data frame, final.df, that will show the average of each variable for each
# activity and each subject.
final.df<- summarise_each(data.df, funs(mean))

#Write final.df to a text file using write.table.
write.table(final.df, "~\\finaldataframe.txt", col.names=TRUE, row.names=FALSE)


