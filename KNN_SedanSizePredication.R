# Load the tidyverse and class libraries 
library(tidyverse)
library(class)

# Set the working directory to your desired folder 
setwd("path/of/working_directory")

# Read SedanSize.csv into a tibble called sedanSize 
sedanSize <- read_csv(file = "SedanSize.csv",
                      col_types = "cfnii",
                      col_names = TRUE)

# Display sedanSize in the console
print(sedanSize)

# Display the structure of sedanSize in the console
str(sedanSize)

# Display the summary of sedanSize in the console 
summary(sedanSize)

# Remove the MakeModel feature from the tibble 
sedanSize <- sedanSize %>% select(-MakeModel)

# Separate the tibble into two distinct tibbles. One with just the label feature and one with the other remaining features
sedanSizeLabels <- sedanSize %>% select(SedanSize)
sedanSize <- sedanSize %>% select(-SedanSize)

# Recreate the displayAllHistograms() function
displayAllHistograms <- function(tibbleDataSet) {
  tibbleDataSet %>%
    keep(is.numeric) %>% 
    gather() %>%
    ggplot() + geom_histogram(mapping = aes(x=value, fill=key),
                              color = "black") + 
    facet_wrap (~ key, scales = "free") +
    theme_minimal()
}

# Call the displayAllHistograms() function, passing in sedanSize as an argument
displayAllHistograms(sedanSize)

# set 517 as the random seed 
set.seed(517)

# Create a vector of 75% randomly sampled rows from the original dataset
sampleSet <- sample(nrow(sedanSize),
                    round(nrow(sedanSize) * 0.75),
                    replace = FALSE)

# Put the records from the 75% sample into sedanSizeTraining
sedanSizeTraining <- sedanSize[sampleSet,]

# Put the records from the 75% sample into sedanSizeTrainingLabels
sedanSizeTrainingLabels <- sedanSizeLabels[sampleSet,]

# Put the records from the 75% sample into sedanSizeTesting
sedanSizeTesting <- sedanSize[-sampleSet,]

# Put the records from the 75% sample into sedanSizeTestingLabels
sedanSizeTestingLabels <- sedanSizeLabels[-sampleSet,]

# kNN model using sedanSizeTraining as the train argument, sedanSizeTesting as the test argument
sedanSizePrediction <- knn(train = sedanSizeTraining,
                           test = sedanSizeTesting,
                           cl = sedanSizeTrainingLabels$SedanSize,
                           k = 7)

# Display the predictions from the testing dataset on the console 
print(sedanSizePrediction)

# Display summary of the predictions from the testing dataset 
print(summary(sedanSizePrediction))

# Evaluate the model by forming a confusion matrix 
sedanSizeConfusionMatrix <- table(sedanSizeTestingLabels$SedanSize,
                                  sedanSizePrediction)

# Display the confusion matrix on the console 
print(sedanSizeConfusionMatrix)

# Calculate the model predictive accuracy and store it into a variable called predictiveAccuracy 
predictiveAccuracy <- sum(diag(sedanSizeConfusionMatrix)) / 
                          nrow(sedanSizeTesting)

# Display the predictive accuracy on the console
print(predictiveAccuracy)

# Create a matrix of k-values with their predictive accuracy
kValueMatrix <- matrix(data = NA,
                       nrow = 0,
                       ncol = 2)

# Assign column names of "k value" and "Predictive accuracy" to the kValueMatrix
colnames(kValueMatrix) <- c("kvalue", "predictive accuracy") 

# Loop through odd values of k from 1 up to the number of records in the 
# training dataset. With each pass through the loop, store the k-value along with 
# its predictive accuracy
for (kValue in 1:nrow(sedanSizeTraining)) {
  if(kValue %% 2 != 0) {
    sedanSizePrediction <- knn(train = sedanSizeTraining,
                               test = sedanSizeTesting,
                               cl = sedanSizeTrainingLabels$SedanSize,
                               k = kValue)
    
    sedanSizeConfusionMatrix <- table(sedanSizeTestingLabels$SedanSize,
                                      sedanSizePrediction)
    
    predictiveAccuracy <- sum(diag(sedanSizeConfusionMatrix)) / 
      nrow(sedanSizeTesting)
    
    kValueMatrix <- rbind(kValueMatrix ,c(kValue, predictiveAccuracy))
  }
}

# Display the kValueMatrix on the console to determine the best k-value 
print(kValueMatrix)
