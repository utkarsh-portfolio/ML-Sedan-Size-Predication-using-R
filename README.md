# Machine-Learning-Projects

The file is an R script that uses the K-Nearest Neighbors (KNN) algorithm to predict sedan size based on a dataset (SedanSize.csv). It utilizes the tidyverse and class libraries. 

## KNN Sedan Size Prediction

This project demonstrates the use of the K-Nearest Neighbors (KNN) algorithm in R to predict the size of sedans based on a given dataset (SedanSize.csv). The script processes the data, visualizes key features, and builds a predictive model using the KNN method.

### Requirements
The following R libraries are required to run the script:

tidyverse
class

### Files
KNN_SedanSizePrediction.R: The main script that handles data processing, visualization, and KNN modeling.
SedanSize.csv: The dataset used for training and testing the model.

### Steps in the Script
#### Data Loading and Exploration:

1. The SedanSize.csv dataset is loaded into a tibble.
Initial exploration is done by printing the dataset structure and summary.
Data Cleaning:

2. The MakeModel feature is removed as it is not required for the prediction task.
The dataset is split into two: one containing the label (SedanSize) and another containing the predictor variables.
Visualization:

3. The script includes a function displayAllHistograms() to plot histograms of all numerical features in the dataset to help understand data distribution.
Data Splitting:

4. A random 75% sample of the data is taken as the training set, with the rest reserved for testing.
Model Training and Prediction:

5. The KNN algorithm is applied to the training set to predict sedan sizes.

#### Running the Script
1. Set your working directory to the folder containing the script and the dataset.
2. Ensure the dataset SedanSize.csv is available in the working directory.



Summary of the Raw data is given in the below image 
![image](https://github.com/user-attachments/assets/aa7e953d-4a30-464d-a9ba-c7369f6681a6)
