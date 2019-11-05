The run_analysis.R script gets the data and cleans it for further use as described by the 5 steps required as described in the course project’s definition.

library data.table was imported for perfoming these steps

# Step 0 is to load test, training, features and activities dataset
Here x_test, y_test,sub_test, x_train, y_train, sub_train, activity_labels, features are used to extract each of the respective datasets

# Next I had performed step 3. Used descriptive activity names to name the activities in the data set
Here y_test and y_train was added with activity names

# Next I had performed step 4. Appropriately labels the data set with descriptive activity names
Here column names from features, activities, subject were added to the respectie datasets

# Next I had performed step 1. merge test and training sets into one data set, including the activities
Datasets merged to bigData.  It had 565 rows and 10299 columns

# Next I  had performed step 2. extract only the measurements on the mean and standard deviation for each measurement
bigData_mean, bigData_sd had the mean and sd values of the datasets respectively

# Finally step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.txt was a comma seperated file, created with the conditions given.  this file has been uploaded above.
