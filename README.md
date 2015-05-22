**Introduction**

The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new - tidy - dataset which may be used for further analysis.

The data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The original dataset included the following data files:

    'features.txt': List of all features.

    'activity_labels.txt': List of class labels and their activity name.

    'train/X_train.txt': Training set.

    'train/y_train.txt': Training labels.

    'train/subject_train.txt': ID's of subjects in the training data

    'test/X_test.txt': Test set.

    'test/y_test.txt': Test labels.

    'test/subject_test.txt': ID's of subjects in the training data

For more information about the "Human Activity Recognition Using Smartphones Dataset Version 1.0" contact: activityrecognition@smartlab.ws

**Description of the script**

* Firstly, we download the dataset and unzip it in a specific folder. We read all features, class and subject files. We append rows and columns to form a complete data frame.
* Secondly, we extract only the measurements on the mean and standard deviation by filtering those features with mean or std in their names. We append to this resulting index, the subject and activity index. And finally, we filter the data frame using the previous index. 
* Afterwards, we create the label vector for all features, and we assign it to the data frame. We load the activity labels content in a data frame and merge it with the previous data frame using the activity id as reference. We also melt the data using the columns 'activity_id', 'activity_name' and 'subject' in order to obtain group the data frame by these variables.
* Finally, we use dcast with the previous variables to obtain the summary statistics by each group.

**Acknowledgements**

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
License:

Use of the Run_Analysis.R script is free for all users.

Use of the resulting dataset "tidy_movement_data.txt" in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the author for its use or misuse. Any commercial use is prohibited.

