## CodeBook.md
Patrick Applegate, papplega@gmail.com

Contains a description of the variables in the tidy data set for the final project in the Getting and Cleaning Data course on Coursera.  

As noted in README.md, the final tidy data set has four columns, "subject", "activity", "variable", and "value".  

#### subject
Contains integers 1-30, indicating the various people who participated in the original study.  

#### activity
Contains strings "walking", "walkingupstairs", "walkingdownstairs", "sitting", "standing", and "laying".  These strings indicate the various activities that the study participants were asked to undertake while wearing smartphones with accelerometers.  The formatting of these strings (all lower case, no separating punctuation) follows the format laid out in Week 4 of the course.  

#### variable
Contains lengthy strings, all starting with "average", reflecting various types of measurements made by the cell phone accelerometers.  Again, the formatting of these strings (all lower case, no separating punctuation) follows the format laid out in Week 4 of the course.  

#### value
Contains numerical values in the interval [-1, 1] representing the averages of various measurements made by the cell phone accelerometers.  Normalization was carried out by the study's original authors, so these data don't have units.  
