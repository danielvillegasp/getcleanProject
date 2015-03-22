#Codebook
## Subject ID
*Variable: Subject
*Description: Number that identifies the Subject performing the experiment.
*Range: 1-30
*Type: Positve Integer
## Activity Name
*Variable: Activity
*Description: Name of the activity performed by the subject during the experiment.
*Range: WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, SITTING, STANDING, LAYING
*Type: String/Factor

## Measurements
The mean value and the standard deviation of a set of variables are included in the dataset,
the variables are described in the list below:

* Body Acceleration
	..*Short Name: BodyAcc
	..*Description: Body Acceleration Signal.
* Gravity Acceleration
	..*Short Name: GravityAcc
	..*Description: Gravity Acceleration Signal.
* Body Jerk
	..*Short Name: BodyAccJerk
	..*Description: First derivative of the Body Acceleration with respect to time.
* Body Angular Velocity
	..*Short Name: BodyGyro
	..*Description: Angular Velocity Signal.
* Body Angular Velocity Jerk
	..*Short Name: BodyGyroJerk
	..*Description: First derivative of the Body Angular Velocity with respect to time.

For each variable the time domain value and the frequency domain are given,

..*Time Domain: Time domain variables have the prefix t e.g. tGravityAcc
..*Frequency Domain: Frequency domain variables have the prefix f

Variables from an specific axis have the suffix X, Y or Z according to the axis.
Magnitude Variables are derived from the X, Y and Z signals and are marked with the suffix Mag.

An example of a variable is 'tBodyAccMeanX', this means the Mean Value of the Body Acceleration along the X-Axis.

Below all of the variables are listed:
..*tBodyAccMeanX
..*tBodyAccMeanY
..*tBodyAccMeanZ
..*tBodyAccStdX
..*tBodyAccStdY
..*tBodyAccStdZ
..*tGravityAccMeanX
..*tGravityAccMeanY
..*tGravityAccMeanZ
..*tGravityAccStdX
..*tGravityAccStdY
..*tGravityAccStdZ
..*tBodyAccJerkMeanX
..*tBodyAccJerkMeanY
..*tBodyAccJerkMeanZ
..*tBodyAccJerkStdX
..*tBodyAccJerkStdY
..*tBodyAccJerkStdZ
..*tBodyGyroMeanX
..*tBodyGyroMeanY
..*tBodyGyroMeanZ
..*tBodyGyroStdX
..*tBodyGyroStdY
..*tBodyGyroStdZ
..*tBodyGyroJerkMeanX
..*tBodyGyroJerkMeanY
..*tBodyGyroJerkMeanZ
..*tBodyGyroJerkStdX
..*tBodyGyroJerkStdY
..*tBodyGyroJerkStdZ
..*tBodyAccMagMean
..*tBodyAccMagStd
..*tGravityAccMagMean
..*tGravityAccMagStd
..*tBodyAccJerkMagMean
..*tBodyAccJerkMagStd
..*tBodyGyroMagMean
..*tBodyGyroMagStd
..*tBodyGyroJerkMagMean
..*tBodyGyroJerkMagStd
..*fBodyAccMeanX
..*fBodyAccMeanY
..*fBodyAccMeanZ
..*fBodyAccStdX
..*fBodyAccStdY
..*fBodyAccStdZ
..*fBodyAccJerkMeanX
..*fBodyAccJerkMeanY
..*fBodyAccJerkMeanZ
..*fBodyAccJerkStdX
..*fBodyAccJerkStdY
..*fBodyAccJerkStdZ
..*fBodyGyroMeanX
..*fBodyGyroMeanY
..*fBodyGyroMeanZ
..*fBodyGyroStdX
..*fBodyGyroStdY
..*fBodyGyroStdZ
..*fBodyAccMagMean
..*fBodyAccMagStd
..*fBodyBodyAccJerkMagMean
..*fBodyBodyAccJerkMagStd
..*fBodyBodyGyroMagMean
..*fBodyBodyGyroMagStd
..*fBodyBodyGyroJerkMagMean
..*fBodyBodyGyroJerkMagStd
