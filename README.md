## Final Project, Getting and Cleaning Data
Patrick Applegate, papplega@gmail.com

### Introduction 

Data analysis often involves spending considerable time putting data into a "tidy" form.  The phrase "tidy data" appears to have been popularized by Hadley Wickham (Wickham, 2014).  Flat files containing tidy data have a single column for each variable, and each row of that column contains a single observation of the corresponding variable (http://jtleek.com/modules/03_GettingData/01_03_componentsOfTidyData/#4; note that this slide includes other properties of tidy data).  This format makes the data relatively easy to analyze using software like R.  

For the final project for the Getting and Cleaning Data course on Coursera, we worked with an "untidy" data set that describes human movement during different activities (Anguita et al., 2013; http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The original experimental data represents measurements of 30 human subjects carrying out various activities of daily living (e.g., standing, sitting, walking upstairs), using smartphone accelerometers.  Presumably, the authors of the original study asked the experimental subjects to carry out these activities while wearing the smartphones.  The data from this experiment can then be used to determine future subjects' activity patterns from accelerometer data.  

The instructions for this final project were as follows (see https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions): 
> You should create one R script called run_analysis.R that does the following.
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names.
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each
> variable for each activity and each subject.

This README.md file describes how the script run_analysis.R works and the nature of the analysis it carries out.  

### Methods

I began the project by inspecting the unzipped files.  The contents of the unzipped directory were as follows:
- activity_labels.txt
- features_info.txt
- features.txt
- README.txt
- test (directory)
  - Inertial Signals (directory; not used)
  - subject_test.txt
  - X_test.txt
  - y_test.txt
- train (directory)
  - Inertial Signals (directory; not used)
  - subject_train.txt
  - X_train.txt
  - y_train.txt

Inspection of these files revealed the following about their structure.  
- As noted in the instructions for the exercise, the data from the experimental subjects was separated into two groups, test and train.  These data sets are in the directories of the same name.  
- The subjects (integers 1-30) are in test/subject_test.txt and train/subject_train.txt.  
- The files test/y_test.txt and train/y_train.txt contain the activity codes (integers 1-6).  The key to these activity codes is in activity_labels.txt.  
- The test/X_test.txt and train/X_train.txt each contain a rectangular block of values.  The columns in these blocks correspond to measured variables, and the names of these variables are given in features.txt.  

Loading the various data files into R using read.table() and applying dim() to them, I learned that they have the following dimensions:
- features.txt: 561 rows by 2 columns (the first column just contains integers 1-561)
- subject_test.txt: 2947 elements
- subject_train.txt: 7352 elements
- X_test.txt: 2947 rows by 561 columns
- X_train.txt: 7352 rows by 561 columns
- y_test: 2947 elements
- y_train: 7352 elements

Step 1 in the instructions asks us to merge the training and test data sets.  The X_*.txt files have 561 columns and features.txt has 561 elements in its second column, confirming that features.txt gives the column names for X_test.txt and X_train.txt.  Similarly, each of the y_*.txt and subject_*.txt files have the same number of elements as the number of rows in the corresponding X_*.txt files.  I therefore used rbind() to bind the X_test and X_train variables on top of one another, and I carried out the same operation for subject_test and subject_train, as well as y_test and y_train.  In a later step, I bound the different resulting variables side by side using cbind().  

Step 2 asks us to extract only the measurements that contain mean or standard deviation values from X_test and X_train.  I inspected features.txt to identify the columns that contain the strings "mean" or "std."  This procedure identified 84 columns containing mean or standard deviation values.  I created a new variable and assigned to it the columns from the stacked X_test and X_train variables that contain the appropriate measurements.  

Step 3 asks us to replace the activity codes in y_*.txt with the corresponding activity names.  I created a vector of activity names using indexing, not through merge().  I then bound the various tall variables together using cbind, as mentioned above.  

Step 4 asks us to label the variables with easily-readable names.  The first lecture of Week 4 (http://jtleek.com/modules/03_GettingData/04_01_editingTextVariables/#16) suggests that variables should be all lower case and should not include abbreviations.  The discussion forums suggested that underscores or dots in variable names are discouraged.  Following this logic, I used gsub repeatedly to replace the various abbreviations with long-form words, and to delete punctuation from the column names.  

Finally, Step 5 involves making the data set tidy, averaging replicate values.  To carry out this step, I first melt()ed the data set using the subject and activity columns as factors.  I then used ddply() to average over the numerical values, using the subject, activity, and variable columns as factors.  

### Results (Code Book)



### References

Anguita, D., Ghio, A., Oneto, L., Parra, X., and Reyes-Ortiz, J. L. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  Available online at  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Wickham, H., 2014.  Tidy Data.  Journal of Statistical Software, v. 59.  Available online at http://www.jstatsoft.org/v59/i10/paper.  
