This codebook is based on the README.MD for the following dataset:

> Human Activity Recognition Using Smartphones Dataset
> Version 1.0

The data was originally compiled by the following individuals and organization:

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Università degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws

More information can be found on the following website:

> [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The following information describing the original data set is taken from the website:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
> Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
> on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
> The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the 
> volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
> and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
> low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz 
> cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For the Coursera Course Getting and Cleaning Data(https://class.coursera.org/getdata-010) course project, the data was modified to join the test and train 
datasets. After merging the datasets, all columns were removed that did not contain mean and standard deviation information. The column names represent the 
feature names and they have been modified to the increase readability and to conform to Google style guide reccomendations. 

"1" "subject.id"
"2" "activity"

The subject.id represent each one of thirty particpants.
The activity represents one of six activities: walking, walking upstairs, walking downstairs, laying, sitting, or standing.

The rest of the column names represent the previous feature names. The value in each column in each row represents the mean value for each particpant for each activity 
for the feature.

According to the features.txt file of the original data set, 'The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.'

For this data set, all coloumn names that begin 'time' are the time domain signals. For example, the 'tBodyAcc-XYZ and tGravityAcc-XYZ' noted above are now, 
'time.body.accel.xyz and time.gravity.accel.xyz'.

Also according to the features.txt file of the origianl dataset, 'Subsequently, the body linear acceleration and angular velocity were derived in time to obtain 
Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). ' These would now be 'time.body.accel.jerk.xyz and time.body.gyro.jerk.xyz'

Furthermore according to the features.txt file of the origianl data set, 'the magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).' This would be represented by 'time.body.accel.mag' etc.

Also according to the features.txt file, 'a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag.' The 'f' is now represented by 'fft'. 

For further information please see the original features.text file.

"3" "time.body.accel.mean.x"
"4" "time.body.accel.mean.y"
"5" "time.body.accel.mean.z"
"6" "time.gravity.accel.mean.x"
"7" "time.gravity.accel.mean.y"
"8" "time.gravity.accel.mean.z"
"9" "time.body.accel.jerk.mean.x"
"10" "time.body.accel.jerk.mean.y"
"11" "time.body.accel.jerk.mean.z"
"12" "time.body.gyro.mean.x"
"13" "time.body.gyro.mean.y"
"14" "time.body.gyro.mean.z"
"15" "time.body.gyro.jerk.mean.x"
"16" "time.body.gyro.jerk.mean.y"
"17" "time.body.gyro.jerk.mean.z"
"18" "time.body.accel.magnitude.mean"
"19" "time.gravity.accel.magnitude.mean"
"20" "time.body.accel.jerk.magnitude.mean"
"21" "time.body.gyro.magnitude.mean"
"22" "time.body.gyro.jerk.magnitude.mean"
"23" "fft.body.accel.mean.x"
"24" "fft.body.accel.mean.y"
"25" "fft.body.accel.mean.z"
"26" "fft.body.accel.mean.freq.x"
"27" "fft.body.accel.mean.freq.y"
"28" "fft.body.accel.mean.freq.z"
"29" "fft.body.accel.jerk.mean.x"
"30" "fft.body.accel.jerk.mean.y"
"31" "fft.body.accel.jerk.mean.z"
"32" "fft.body.accel.jerk.mean.freq.x"
"33" "fft.body.accel.jerk.mean.freq.y"
"34" "fft.body.accel.jerk.mean.freq.z"
"35" "fft.body.gyro.mean.x"
"36" "fft.body.gyro.mean.y"
"37" "fft.body.gyro.mean.z"
"38" "fft.body.gyro.mean.freq.x"
"39" "fft.body.gyro.mean.freq.y"
"40" "fft.body.gyro.mean.freq.z"
"41" "fft.body.accel.magnitude.mean"
"42" "fft.body.accel.magnitude.mean.freq."
"43" "fft.body.body.accel.jerk.magnitude.mean"
"44" "fft.body.body.accel.jerk.magnitude.mean.freq."
"45" "fft.body.body.gyro.magnitude.mean"
"46" "fft.body.body.gyro.magnitude.mean.freq."
"47" "fft.body.body.gyro.jerk.magnitude.mean"
"48" "fft.body.body.gyro.jerk.magnitude.mean.freq."
"49" "angletime.body.accel.mean.gravity."
"50" "angletime.body.accel.jerk.mean.gravity.mean."
"51" "angletime.body.gyro.mean.gravity.mean."
"52" "angletime.body.gyro.jerk.mean.gravity.mean."
"53" "anglex.gravity.mean."
"54" "angley.gravity.mean."
"55" "anglez.gravity.mean."
"56" "time.body.accel.std.x"
"57" "time.body.accel.std.y"
"58" "time.body.accel.std.z"
"59" "time.gravity.accel.std.x"
"60" "time.gravity.accel.std.y"
"61" "time.gravity.accel.std.z"
"62" "time.body.accel.jerk.std.x"
"63" "time.body.accel.jerk.std.y"
"64" "time.body.accel.jerk.std.z"
"65" "time.body.gyro.std.x"
"66" "time.body.gyro.std.y"
"67" "time.body.gyro.std.z"
"68" "time.body.gyro.jerk.std.x"
"69" "time.body.gyro.jerk.std.y"
"70" "time.body.gyro.jerk.std.z"
"71" "time.body.accel.magnitude.std"
"72" "time.gravity.accel.magnitude.std"
"73" "time.body.accel.jerk.magnitude.std"
"74" "time.body.gyro.magnitude.std"
"75" "time.body.gyro.jerk.magnitude.std"
"76" "fft.body.accel.std.x"
"77" "fft.body.accel.std.y"
"78" "fft.body.accel.std.z"
"79" "fft.body.accel.jerk.std.x"
"80" "fft.body.accel.jerk.std.y"
"81" "fft.body.accel.jerk.std.z"
"82" "fft.body.gyro.std.x"
"83" "fft.body.gyro.std.y"
"84" "fft.body.gyro.std.z"
"85" "fft.body.accel.magnitude.std"
"86" "fft.body.body.accel.jerk.magnitude.std"
"87" "fft.body.body.gyro.magnitude.std"
"88" "fft.body.body.gyro.jerk.magnitude.std"
