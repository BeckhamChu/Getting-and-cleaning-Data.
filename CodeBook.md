# CodeBook

## Data Source
The data are from the UCI Human Activity Recognition Using Smartphones dataset.
They were collected from 30 subjects performing six different activities while wearing
a Samsung Galaxy S smartphone.

## Variables

### Identifiers
- subject: Identifier of the subject who performed the activity (integer: 1–30)
- activity: Type of activity performed by the subject

### Activity Labels
The activity variable contains the following descriptive values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Measurement Variables
The remaining variables are numeric and represent the average value of each measurement
for each subject and each activity.

They are derived from the mean and standard deviation of:
- Body Accelerometer signals
- Body Gyroscope signals
- Frequency domain signals

Examples of variable names:
- TimeBodyAccelerometerMeanX
- TimeBodyAccelerometerSTDY
- FrequencyBodyGyroscopeMeanZ
- TimeBodyAccelerometerMagnitudeMean

## Data Transformation Steps
1. Training and test data sets were merged into a single data set.
2. Only measurements containing mean() or std() were extracted.
3. Activity identifiers were replaced with descriptive activity names.
4. Variable names were cleaned and expanded for clarity.
5. A tidy data set was created by calculating the average of each variable
   for each subject and each activity.

## Output
The final output is a tidy data set stored in the file:
- tidy_dataset.txt

Each row represents one subject performing one activity, and each column
represents the average of a specific measurement.
