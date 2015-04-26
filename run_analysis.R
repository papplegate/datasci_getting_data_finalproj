# run_analysis.R
# Patrick Applegate, papplega@gmail.com
# 
# Reads in data from the "Human Activity Recognition Using Smartphones Data Set,"
# downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition
# +Using+Smartphones in April 2015.  This data is then processed to make it tidy,
# following Wickham, H., Tidy data, Journal of Statistical Software, 
# http://www.jstatsoft.org/v59/i10/paper.  

# Clear away any variables and functions in memory.  
rm(list = ls())

# Go get some packages we'll need.  
# install.packages('plyr')
# install.packages('tidyr')
# install.packages('reshape2')
require('plyr')
require('tidyr')
require('reshape2')

# Set the working directory.  Note that this directory is machine-specific; 
# you will have to change it to work on your computer.  
setwd('/Users/Nordenskjold/Documents/Work/data_sci/3_data_getting_cleaning/final_proj/UCI HAR Dataset')

# Define which columns from the data files should be kept.  The vector cols 
# is based on manual inspection of features.txt.  
cols <- c(1: 3, 4: 6, 41: 43, 44: 46, 81: 83, 84: 86, 121: 123, 124: 126, 161: 163, 164: 166, 201, 202, 214, 215, 227, 228, 240, 241, 266: 268, 269: 271, 294: 296, 345: 347, 348: 350, 373: 375, 424: 426, 427: 429, 452: 454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552, 555: 557, 558: 561)

# Read in the individual data files.  The subj.* variables contain integers
# 1-30 indicating the person associated with the measurement, the y.* variables
# contain integers 1-6 indicating the activities (these codes correspond to
# the ones in activity_labels.txt), and the x.* variables contain the
# actual measurements.  
subj.test <- read.table('test/subject_test.txt')
subj.train <- read.table('train/subject_train.txt')
y.test <- read.table('test/y_test.txt')
y.train <- read.table('train/y_train.txt')
x.test <- read.table('test/X_test.txt')
x.train <- read.table('train/X_train.txt')

# Read in some key tables.  act.codes contains the activity codes; 
# features contains the column names for the x* matrices.  
act.codes <- read.table('activity_labels.txt')
features <- read.table('features.txt')
act.codes[, 2] <- apply(as.matrix(act.codes[, 2]), 1, tolower)
act.codes[, 2] <- gsub('_', '', act.codes[, 2])

# Massage features so that it contains descriptive names.  
features[, 2] <- gsub('\\(', '', features[, 2])
features[, 2] <- gsub('\\)', '', features[, 2])
features[, 2] <- gsub('-', '', features[, 2])
features[, 2] <- gsub(',', '', features[, 2])
features[, 2] <- gsub('tBody', 'averagetimebody', features[, 2])
features[, 2] <- gsub('tGravity', 'averagetimegravity', features[, 2])
features[, 2] <- gsub('fBody', 'averagefrequencybody', features[, 2])
features[, 2] <- gsub('bodyBody', 'body', features[, 2])
features[, 2] <- gsub('Acc', 'acceleration', features[, 2])
features[, 2] <- gsub('Jerk', 'jerk', features[, 2])
features[, 2] <- gsub('Gyro', 'gyro', features[, 2])
features[, 2] <- gsub('Mag', 'magnitude', features[, 2])
features[, 2] <- gsub('Freq', 'frequency', features[, 2])
features[, 2] <- gsub('Mean', 'mean', features[, 2])
features[, 2] <- gsub('std', 'standarddeviation', features[, 2])
features[, 2] <- gsub('X', 'xaxis', features[, 2])
features[, 2] <- gsub('Y', 'yaxis', features[, 2])
features[, 2] <- gsub('Z', 'zaxis', features[, 2])

# Bind the different variables from the last step into tall matrices or
# vectors.  
subj.all <- rbind(subj.test, subj.train)
y.all <- rbind(y.test, y.train)
x.all <- rbind(x.test, x.train)

# Associate the column names in features with x.all.  
colnames(x.all) <- as.character(features[, 2])

# Keep just the columns that contain information on the mean and standard
# deviation of the different variables.  
x.trim <- x.all[, cols]

# Create a vector of text activity types, using the activity codes from
# y.all and the table in act.codes.  
activity <- act.codes[unlist(y.all), 2]

# Perform another binding step.  
data <- cbind(subj.all, activity, x.trim)

# Using the order command, sort data by the subject (column 1) and then
# the activity (column 2).  
data <- data[order(data[, 1], data[, 2]), ]

# Give data appropriate column names and turn it into a data frame.  
colnames(data) <- c('subject', 'activity', colnames(x.trim))
data <- as.data.frame(data)

# Melt the data so that it turns into long form.  
data.melt <- melt(data, id = c('subject', 'activity'), measure.vars = colnames(x.trim))

# Average over the data frame, using the subject, activity, and variable
# columns as factors.  
data.ddply <- ddply(data.melt, .(subject, activity, variable), numcolwise(mean))

# Write out the tidy data set.  
write.table(data.ddply, 'tidy_data.txt', row.name = FALSE)
