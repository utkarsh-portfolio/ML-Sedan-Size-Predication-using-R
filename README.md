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
2. Initial exploration is done by printing the dataset structure and summary.

#### Data Cleaning:

3. The MakeModel feature is removed as it is not required for the prediction task.
4. The dataset is split into two: one containing the label (SedanSize) and another containing the predictor variables.

#### Visualization:

5. The script includes a function displayAllHistograms() to plot histograms of all numerical features in the dataset to help understand data distribution.

#### Data Splitting:

6. A random 75% sample of the data is taken as the training set, with the rest reserved for testing.
   
#### Model Training and Prediction:

7. The KNN algorithm is applied to the training set to predict sedan sizes.

#### Running the Script
1. Set your working directory to the folder containing the script and the dataset.
2. Ensure the dataset SedanSize.csv is available in the working directory.


#### Here are few important output results - 

Summary of the Raw data - 
![image](https://github.com/user-attachments/assets/aa7e953d-4a30-464d-a9ba-c7369f6681a6)

Histogram to understand the distribution of key features
![image](https://github.com/user-attachments/assets/e9586a91-2098-4bfb-a75a-ac947e5f5419)

Confusion Maxtrix -
![image](https://github.com/user-attachments/assets/6ac42e2a-98ee-4955-9155-e64075c588d6)

Final Output of K Value Matrix -
![image](https://github.com/user-attachments/assets/997e71e9-8218-48f7-9a50-4b256d5a6eca)

The best value for k is 1, 3, 5, 7, 9, or 15 as they all yield the highest predictive accuracy of 0.8571.

This model can help an automobile manufacturer predict the size of a sedan (e.g., small, medium, large) based on features like price, road test score, and reliability, enabling the optimization of vehicle designs based on these parameters.



