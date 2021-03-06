#Getting-and-Cleaning-Data-Course-Project Code Book
## Introduction

The getting and data cleaning process consists of many variables and are categorized in Variable, Train Variables, Test Variables, Train and Test Variables, and Tidy Data Variables.

The Variables, Train Variables, and Test Variables are used to produce the final product. The final product are the Train and Test Variables and Tidy Data Variables.

* The Tr_y and T_y contain 6 different activities
* The Tr_sbj and T_sbj contain 30 subjects
* The Tr_x and T_x contain 17 features and for each feature 2 measurements (17 x 2 = 34 total)

There were multiple steps to process the data.

1. The features table was created and a variable was set with only the extracted features required (mean and std)
2. The activity and subjects tables were created
3. The train and test data tables were created separately and their column names were set by the features table and then the extracted features variable removed any columns without mean and std in their name. 
4. The train and test data tables were merged with their respective subjects table and activity table
5. The train and test data tables were merged together with rbind()
6. A new data set was created with the mean values of the features

## Variables
* features: Imported "features.txt" file into a table
* extract_features: extracted the rows that contain the word "mean" or "std"
* activity: Imported "activity.txt"  file into a table 

## Train Variables
* Tr_x: Imported X_train.txt file into a table with features that contain the word "mean" or "std"
* Tr_y: Contains the "y_train.txt" and the "activity"table 
* Tr_sbj: Contains the train "subject_train.txt" into a table 
* Train: Contains all the train data (merged with Tr_sbj, Tr_y, and Tr_x tables)

## Test Variables
* T_x: Imported X_test.txt file into a table with features that contain the word "mean" or "std"
* T_y: Contains the "y_test.txt" and the "activity" table 
* T_sbj: Contains the test "subject_test.txt" into a table 
* Test: Contains all the test data (merged with T_sbj, T_y, and T_x tables)

## Train and Test Variable
* data: Contains Train and Test data (10299 observations and 82 variables)

## Tidy Data Variable
* tidy_data: Contains the Train and Test data with the average of each variable. (3,160 observations and 4 variables)


