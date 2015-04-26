## Final Project, Getting and Cleaning Data
Patrick Applegate, papplega@gmail.com

### Introduction 

Data analysis often involves spending considerable time putting data into a "tidy" form.  The phrase "tidy data" appears to have been popularized by Hadley Wickham (Wickham, 2014).  Flat files containing tidy data have a single column for each variable, and each row of that column contains a single observation of the corresponding variable (http://jtleek.com/modules/03_GettingData/01_03_componentsOfTidyData/#4; note that this slide includes other properties of tidy data).  This format makes the data relatively easy to analyze using software like R.  

For the final project for the Getting and Cleaning Data course on Coursera, we worked with an "untidy" data set that describes human movement during different activities (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The original experimental data represents measurements of 30 human subjects carrying out various activities of daily living (e.g., standing, sitting, walking upstairs), using smartphone accelerometers.  Presumably, the authors of the original study asked the experimental subjects to carry out these activities while wearing the smartphones.  The data from this experiment can then be used to determine future subjects' activity patterns from accelerometer data.  

For the final project for the Getting and Cleaning Data course on Coursera, I
1. downloaded the data set from the Internet location listed above and unzipped this archive file on my computer;
2. wrote an R script, run_analysis.R, that reads in the untidy data, processes it, and creates a text file containing tidy data; and
3. uploaded the script, a README file, and a code book describing the variables in the tidy data file to Github.  

This README.md file describes how the script run_analysis.R works and the nature of the analysis it carries out.  

### Methods

I began the project by inspecting the unzipped files.  The contents of the unzipped directory were as follows:
- activity_labels.txt
- features_info.txt
- features.txt
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



### Reference

Wickham, H., 2014.  Tidy data.  Journal of Statistical Software, v. 59.  Available online at http://www.jstatsoft.org/v59/i10/paper.  
