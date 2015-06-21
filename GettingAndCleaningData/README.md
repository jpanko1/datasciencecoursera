Cleaning the Human Activity Recognition Data
========================================================

The script run_analysis.R cleans and tidies the [Human Activity Recogntion data from the UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The steps for cleaning the data are as follows.

## Cleaning the Data

### Extract the features related to mean and std of the measurements

Extracting the needed features is done first to get the data set as small as possible so that other actions, like merging, can be more efficient.  (The instructions for this assignment did not require the steps be done in any particular order, except for the last two steps.)

The file features.txt is read into a dataframe.  The needed columns related to mean and std are grepped.

The training and test sets are read into dataframes.  Then, the data sets are reduced to the needed columns.

### Merge the training and test sets and Label the data with descriptive variable names

The subject IDs and activity labels are loaded and prepended as appropriate to the training and test sets.  Improved header names are given to the data sets.  Then, the data sets are merged.

### Add appropriate activity name to each row

The file activity_labels.txt is read into a dataframe, and then merged into the data set so that each row of the data contains the appropriate activity name for that row.

