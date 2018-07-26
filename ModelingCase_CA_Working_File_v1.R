

setwd("~/HarvardSummerStudent2018/lessons/11_Aug1-GroupPPTs/modelingCase/training")

library(dplyr)


# import data
data1 <- read.csv("CurrentCustomerMktgResults.csv")
data2 <- read.csv("householdAxiomData.csv")
data3 <- read.csv("householdCreditData.csv")
data4 <- read.csv("householdVehicleData.csv")
names(data1)
names(data2)
names(data3)
names(data4)

# join 4 data sets into 1
baseData <- full_join(data1, data2, by = c("HHuniqueID"))
baseData2 <- full_join(baseData, data3, by = c("HHuniqueID"))
baseDataFull <- full_join(baseData2, data4, by = c("HHuniqueID")) 

# Check rows and columns
colCheck <- ncol(baseDataFull) - (ncol(data1) + ncol(data2) + ncol(data3) + ncol(data4) - 3)
colCheck   # Column check is OK.
# TO DO: row count for data 1 is 4000, for all other data it is 5000. Why is this and what is the impact on the data join? To be assessed!!!

# run a summary on the full data to perform EDA
summary(baseDataFull)
str(baseDataFull)


