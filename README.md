##This repo is for the Coursera Class Getting and Cleaning Data and the course project associated with that class

The repo contains the following files:

* run_analysis.R - The R scipt for converting the data to a tidy set.
* CodeBook.md - A codebook for the project decribing the variables, data and data transformations.
* README.md - This file.

The R script, run__analysis.R, takes the original data files and merges the training and test data sets into a single data file. The file is then subsetted based on variables that only contain mean and std (mean and standard deviation). The data is then modified by substituting the avtivity names for activity numbers. The activity names information is in the activity_labels.txt file. The data is then aggregated by indivdual and activity. Finally, a tidy set of data is exported as a text file.  See the code book and comments in the script for complete details.  



** License: **

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
