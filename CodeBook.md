##Getting and Cleaning Data class project Codebook

* Part 1 - Variable Descriptions
* Part 2 - The Data
* Part 3 - Data Transformations

###Part 1 - Variable Descriptions

The data is from the following website http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and the short description of the data is Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Please note that the original variable names have been changed to lower case per step 4 and class lecture indicating that lower case should be used. Also, hyphens and parenthesis were removed. IMO camel case is easier to read with these variable names.
 
- tbodyaccxyz
- tgravityaccxyz
- tbodyaccjerkxyz
- tbodygyroxyz
- tbodygyrojerkxyz
- tbodyaccmag
- tgravityaccmag
- tbodyaccjerkmag
- tbodygyromag
- tbodygyrojerkmag
- fbodyaccxyz
- fbodyaccjerkxyz
- fbodygyroxyz
- fbodyaccmag
- fbodyaccjerkmag
- fbodygyromag
- fbodygyrojerkmag

The set of variables that were estimated from these signals are: 

- mean: Mean value - used in tidy data set
- std: Standard deviation  - used in tidy data set
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

###Part 2 - Date set information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

* The data come from 30 individuals numbered 1 through 30
* The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.
* The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
* Number of instances 10299
* Number of attributes 561
* Data donation date is 2012-12-10 

**Attribute Information**

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The tidy data set was condensed to just the variable names that contain "mean" or "std" this resulted 79 variable names plus individual and activity. There are 30 individuals and 6 activities, this resulted in 180 rows of data. 

##Part 3 - Data transformations

The data underwent the following transformations to get to the desired tidy set described in the project requirements here https://class.coursera.org/getdata-006/human_grading/view/courses/972584/assessments/3/submissions (need to be signed into Coursera to view this webpage.

- Download data and extract pertinant zipped files to a subdirectory of the R working directory named "project"
- Merge the training and test data sets
- Create a vector for the column names and insert the column names
- Subset complete data.frame for just the columns that that are mean and std dev per project description step 2
- Use activity names instead of activity numbers per project step 3
- Change variable names to more appropriate names. Per the course lectures this required changing the data to lower class, remove hyphens and parenthesis
- Write the tidy data to a seperate file in the project directory. The file is tidydata.txt and is a comma deliminated .txt file.

The R script for making the tidy data is https://github.com/gpw797/R-data-project/blob/master/run_analysis.R

#### note that the R file run_analysis.R is well documented with comments 




