# GettingAndCleaningDataCourseProject
Coursera Johns Hopkins Getting and Cleaning Data Course Project

###1. Merge the training and the test sets to create one data set. 

This will be achieved by first creating three interim data frames, cleaning each, and then merging **The actual command to create the one data set 
can be found in section 4 below and on line 95 of the run_analysis.R file.**

The script reads each text file into data frame. **NOTE** The original files were in my working directory and the code is written to read the files from the user's
working directory.
It binds x.train.df and x.test.df, dataframes that contain x_train.txt and x_test.txt, into x.df, an interim data frame to be cleaned.
It binds subject.train.df and subject.test.df, dataframes that contain subject_train.txt and subject_test.txt, into subject.df, an interim data frame.
It binds y.train.df and y.test.df, dataframes that contain y_train.txt and y_test.txt, into y.df, an interim data frame.


###2. Extract only the measurements on the mean and standard deviation for each measurement.

The script cleans features.df to remove () and - in accordance with Google style guide standards. 
It replaces variable names in x.df (V1,V2, etc.) with names from features.df. 
It removes duplicated columns from x.df.
It removes non-mean and non-standard deviation columns, that is it leaves all columns that contain the words mean and std, by first, creating one data frame with only 
means and one with only stds and then putting them back together.


###3. Use descriptive activity names to name the activities in the data set.

The script changes activity numbers in y.df to activity names by first creating an ordered vector of the names called activity.vector that contains the activity names.
It then adds the vector back to y.df as an additional column. The original column is deleted after merging all the dataframes together.

###4. Appropriately label the data set with descriptive variable names. 

The script makes x.df column names (the old features names) Google style guide compliant, that is all lower case with periods.
It replaces column names in x.df with newly formatted names in names.vector.
It adds a column name to subject.df before the final binding all the dataframes into the main data frame.
It binds x.df, subject.df, y.df to form data.df. **This corresponds to the first requirement of the assignment.**
It removes the V1 column that contains the activity number (part of y.df) that is now extraneous.


###5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

There will be 180 rows (30 participants * 6 activities) and there will be 88 columns (2 fixed variables + 86 measured observations) in the dataset. 

The script groups data.df first by the subject id and then by the activity description.
It creates the final data frame, final.df, that will show the average of each variable for each activity and for each subject. 
Finally, it writes final.df to a text file using write.table.