# Author: Alejandro Hernandez
# Last edited: 5/25/2022

# ---- OBJECTIVE ----
# The objective of this script is to conduct exploratory analysis of 2349 
# records of children with fever presented to the emergency room and tested
# for serious bacterial infection (SBI).

# The following 9 variables are included :
# id – patient’s number
# fever_hours – duration of the fever in hours
# age – child’s age
# sex – child’s sex (M / F)
# wcc – white cell count
# prevAB – previous antibiotics (Yes / No)
# sbi – serious bacterial infection (Not Applicable / UTI / Pneum / Bact)
# pct – procalcitonin
# crp – c-reactive protein



# ---- DATA CONNECTION ----
# Set working directory if CSV file not in project folder
# setwd("")
sbi_df <- read.csv("SBI.csv")
# This doesn't hurt to do because we're only working with one dataset here
attach(sbi_df)

# Make sure we have columns for all 9 variables
colnames(sbi_df)
# Looks like we have an unexpected variable X, we'll handle that in the next step

# Peek the dataset
head(sbi_df)
tail(sbi_df)
# X is a (unnecessary) variable used to index, we can get rid of it
sbi_df <- subset(sbi_df, select=-c(X))

# Looks good so far, let's check for NA's in each variable
apply(sbi_df, 2, anyNA)

# To conduct analysis on the categorical variables, we need to convert them to 
# factors
sex <- factor(sex, labels=c(0,1))  # 0 (female) and 1 (male)
prevAB <- factor(prevAB, labels=c(0,1))  # 0 (no) and 1 (yes)
sbi <- factor(sbi, labels=c(3,0,2,1)) # 0 (NotApplicable), 1 (UTI), 2 (Pneum), 3 (Bact)



# Awesome, let's now begin exploring this dataset!



# ---- EXPLORATORY ANALYSIS ----

pairs(~id + fever_hours + age + sex + wcc + prevAB + sbi + pct + crp, 
      main='SBI Scatterplot Matrix')





















