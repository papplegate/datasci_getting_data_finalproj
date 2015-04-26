# Final Project, Getting and Cleaning Data
Patrick Applegate, papplega@gmail.com

Data analysis often involves considerable time putting data into a "tidy" form.  The phrase "tidy data" appears to have been popularized by Hadley Wickham, who has published a paper with the same name (Wickham, 2014).  Flat files containing tidy data have a single column for each variable, and each row of that column contains a single observation of the corresponding variable (http://jtleek.com/modules/03_GettingData/01_03_componentsOfTidyData/#4; note that this slide includes other properties of tidy data).  This format makes the data relatively easy to analyze using software like R.  

For the final project for the Getting and Cleaning Data course on Coursera, I
1) downloaded an "untidy" data set from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
2) wrote an R script, run_analysis.R, that reads in the untidy data, processes it, and creates a text file containing tidy data, and
3) uploaded the script, a README file, and a code book describing the variables in the tidy data file to Github.  

This README.md file describes how the script run_analysis.R works and the nature of the analysis it carries out.  



# Reference

Wickham, H., 2014.  Tidy data.  Journal of Statistical Software, v. 59.  Available online at http://www.jstatsoft.org/v59/i10/paper.  
