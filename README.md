# README
Script rin_analysis.R takes data from files X_test.txt, y_test.txt, X_train.txt, y_train.txt, activity_labels.txt, features.txt.
First, it creates a single dataset from train and test data, then it assigns correct names to all variables. After that, it selects variables with only mean and std values(not counting the activity variable). Script assigns descriptive activity labels to all activities and finally creates a dataset grouped by activities with averages for all variables. This dataset is returned in variable res2.