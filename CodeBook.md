The MeanDataSet.txt file produced from the data in:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

A description of the original data can be found in the README.txt file found in the archive.
A description of the features measured in the study can be found in features_info.txt.

The data in MeanDataSet.txt consists of:

Column Name: Activity
Description: Activity being performed by the subject
Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 

Column Name: Subject
Description: Identifier for subject performing the activity
Values: integers 1 through 30

The remaining columns contain the mean value of the corresponding column in the original dataset, grouped by Activity and Subject. 

Mean values for the estimate variables of the feature vector for each pattern:  
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
    mean: Mean value
    std: Standard deviation
    meanFreq: Weighted average of the frequency components to obtain a mean frequency

Values of the factor means are floating point numbers from -1 to 1.
