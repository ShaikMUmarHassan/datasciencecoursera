# Getting And Cleaning Data - Week 4 assignment
This is an assignment for the Getting and Cleaning Data course.

### Code explaination
the code combines two datasets namely train and test data. then the required variables are extracted and created anoted dataset having average of each variable in each activity

### The Algorithm
The R script, `run_analysis.R`, has following steps:
1. Download the dataset if it does not already exist in the working directory

2. Load the activity and feature info

3. Loads both the training and test datasets, keeping only those columns which
   reflect a mean or standard deviation

4. Loads the activity and subject data for each dataset, and merges those
   columns with the dataset

5. Merges the two datasets

6. Creates a tidy dataset that consists of the averagemean value of each
   variable for each activity and subject.
   
7. The Final processed result is stored in a file named `tidy.txt`.
