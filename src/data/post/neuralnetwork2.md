---
publishDate: 2025-03-14T00:00:00Z
title: "Neural Network II"
excerpt: "Energy Efficient Modeling"
category: "Econometrics"
tags: ["econometrics"]
---

## Energy Efficient Modeling

```r
library(readxl)
eneff <- read_excel("./data/ENB2012_data.xlsx")
names(eneff) <- c("relCompactness", "surfArea", "wallArea", "roofArea", "height", "orientation", "glazArea", "glazAreaDist", "heatLoad", "coolLoad")
eneff <- eneff[complete.cases(eneff),]

# check if the dat frame contains factors
qfactor <- sapply(eneff, is.factor)
qfactor
```

relCompactness surfArea wallArea roofArea
FALSE FALSE FALSE FALSE
height orientation glazArea glazAreaDist
FALSE FALSE FALSE FALSE
heatLoad coolLoad
FALSE FALSE

```r
library(caret)
eneff$orientation <- factor(eneff$orientation)
eneff$glazAreaDist <- factor(eneff$glazAreaDist)
dummies <- dummyVars(heatLoad + coolLoad ~ ., data = eneff)
eneff_data <- cbind(as.data.frame(predict(dummies, newdata = eneff)),eneff[,9:10])

set.seed(474576)
eneff_sampling_vector <- createDataPartition(eneff_data$heatLoad, p = 0.80, list = FALSE)
eneff_train <- eneff_data[eneff_sampling_vector,1:16]
eneff_train_outputs <- eneff_data[eneff_sampling_vector,17:18]
eneff_test <- eneff_data[-eneff_sampling_vector,1:16]
eneff_test_outputs <- eneff_data[-eneff_sampling_vector,17:18]

# Pre Process Inputs
eneff_pp <- preProcess(eneff_train, method = c("range"))
eneff_train_pp <- predict(eneff_pp, eneff_train)
eneff_test_pp <- predict(eneff_pp, eneff_test)

# Pre Process Outputs
eneff_train_out_pp <- preProcess(eneff_train_outputs, method = c("range"))
eneff_train_outputs_pp <- predict(eneff_train_out_pp,eneff_train_outputs)
eneff_test_outputs_pp <- predict(eneff_train_out_pp,eneff_test_outputs)

library("neuralnet")
n <- names(eneff_data)
f <- as.formula(paste("heatLoad + coolLoad ~", paste(n[!n %in% c("heatLoad","coolLoad")], collapse = " + ")))
eneff_model = neuralnet(f,data=cbind(eneff_train_pp,eneff_train_outputs_pp),hidden=10)

# Visualize the trained NN model
plot(eneff_model, rep="best")
```

![Illustration of the trained NN model|400](https://i.imgur.com/ApMD34p.png)

The neuralnet() also allows us to specify other parameters. For example, we could choose different activation functions, or have the output linear.output specified. A simple case is provided in Table 10.1.4. We had “linear.output = FALSE” used in the college example in Lesson 9 as an activation function must be applied to the output layer in a classification problem modeled using an NN model.

```r
# Try two hidden layers
eneff_model_h = neuralnet(f,data=cbind(eneff_train_pp,eneff_train_outputs_pp),hidden=c(6,6))
plot(eneff_model_h, rep="best")
```

![two hidden layers|400](https://i.imgur.com/wftQCug.png)

```r
# Specifiying an activation function
eneff_model <- neuralnet(f,
 data=cbind(eneff_train_pp,eneff_train_outputs_pp),hidden=10, act.fct="logistic",linear.output=TRUE, err.fct="sse", rep=1)
plot(eneff_model, rep="best")
```

![logistic activation function|400](https://i.imgur.com/HZdE8Uu.png)

Regardless of the structure of an NN model, unless it performs well in terms of providing good predictions it has little potential of use in practice. The package neuralnet provides the compute() function, which gives us an easy method to evaluate the developed model in this regard. “Essentially, it provides us with not only the predicted output for a data frame of observations, but also shows us the output values of all the neurons in the model's architecture.” (Forte, 2015)

To evaluate multilayer perceptrons for regression, we will check what the MSE is for the predictions of both outputs. Table 10.1.5 shows the R script and Table 10.1.6 provides the results of our evaluation. As suggested by the text book, you could add another layer to compare their results. It is extremely simple to do it as you could set hidden=c(6,6) or other two numbers you like.

```r
####################################################
# Evaluating multilayer perceptrons for regression
####################################################

test_predictions <- compute(eneff_model,eneff_test_pp)

reverse_range_scale <- function(v, ranges) {
  return( (ranges[2] - ranges[1])*v + ranges[1] )
}

test_predictions <- as.data.frame(test_predictions$net.result)
output_ranges <- eneff_train_out_pp$ranges
test_predictions_unscaled <- sapply(1:2,function(x) reverse_range_scale(test_predictions[,x],output_ranges[,x]))

mse <- function(y_p, y) {
  return(mean((y-y_p)^2))
}

mse(test_predictions_unscaled[,1],eneff_test_outputs[,1])
mse(test_predictions_unscaled[,2],eneff_test_outputs[,2])
cor(test_predictions_unscaled[,1],eneff_test_outputs[,1])
cor(test_predictions_unscaled[,2],eneff_test_outputs[,2])
```

mse(test_predictions_unscaled[,1],eneff_test_outputs[,1])
[1] 0.2077134
mse(test_predictions_unscaled[,2],eneff_test_outputs[,2])
[1] 1.249745
cor(test_predictions_unscaled[,1],eneff_test_outputs[,1])
[1] 0.9990324
cor(test_predictions_unscaled[,2],eneff_test_outputs[,2])
[1] 0.9936815

The results above shows that MSEs are small. The results also show that the predicted values are highly correlated with the original values. Hence the developed model describes (i.e., predicts) the behavior of the “system” well, which means that the developed model is a very good model.

## Solving a Classification Problem Using Neural Networks

Different from our last problem, the second example in the text for NN models shows how we can solve a classification problem using an NN model (i.e. the output is categorical). The needed data set can be downloaded from the [Glass Identification Data Set](https://archive.ics.uci.edu/ml/datasets/glass+identification) (<https://archive.ics.uci.edu/ml/datasets/glass+identification>).

Data attribute information is shown below (Table 10.2.1). Please read the text carefully as a different package called “nnet" is used for this example. As indicated in the “Type of glass” in Table 10.2.1, the output variable is categorical, defining 7 different types of glasses. Therefore, a logistic regression activation function instead of a linear regression activation function should be applied to the output layer. Note that an overfitting issue is also well explained in this example in the text.

![](https://i.imgur.com/Wa3COJC.png)

```r
library("nnet")
library(caret)

glass <- read.csv("./data/glass.data", header=FALSE)
names(glass) <- c("id","RI","Na", "Mg", "Al", "Si", "K", "Ca", "Ba", "Fe", "Type")
glass$id <- NULL

# Prepare outputs
glass$Type<- factor(glass$Type)
set.seed(4365677)
glass_sampling_vector <- createDataPartition(glass$Type, p = 0.80, list = FALSE)
glass_train <- glass[glass_sampling_vector,]
glass_test <- glass[-glass_sampling_vector,]

glass_pp <- preProcess(glass_train[1:9], method = c("range"))
glass_train <- cbind(predict(glass_pp, glass_train[1:9]),Type = glass_train$Type)
glass_test  <- cbind(predict(glass_pp, glass_test[1:9]), Type = glass_test$Type)

glass_model <- nnet(Type ~ ., data = glass_train, size = 10)
glass_model <- nnet(Type ~ ., data = glass_train, size = 10, maxit = 1000)
```

weights: 166
initial value 399.888767
iter 10 value 180.738182
iter 20 value 136.365075
iter 30 value 89.372598
iter 40 value 63.788808
iter 50 value 46.124329
iter 60 value 38.396790
iter 70 value 32.555106
iter 80 value 29.838130
iter 90 value 28.733172
iter 100 value 27.923797
final value 27.923797
stopped after 100 iterations

...
iter 970 value 33.081691
iter 980 value 33.073842
iter 990 value 33.073514
iter1000 value 33.071742
final value 33.071742
stopped after 1000 iterations

```r
train_predictions <- predict(glass_model, glass_train[,1:9], type = "class")
mean(train_predictions == glass_train$Type)

glass_model2 <- nnet(Type ~ ., data = glass_train, size = 50, maxit = 10000)
train_predictions2 <- predict(glass_model2, glass_train[,1:9], type = "class")
mean(train_predictions2 == glass_train$Type)

test_predictions2 <- predict(glass_model2, glass_test[,1:9], type = "class")
mean(test_predictions2 == glass_test$Type)

glass_model3 <- nnet(Type~., data = glass_train, size = 10, maxit = 10000, decay = 0.01)
train_predictions3 <- predict(glass_model3, glass_train[,1:9], type = "class")
mean(train_predictions3 == glass_train$Type)
test_predictions3 <- predict(glass_model3, glass_test[,1:9], type = "class")
mean(test_predictions3 == glass_test$Type)
```

mean(train_predictions2 == glass_train$Type)
[1] 1

mean(test_predictions2 == glass_test$Type)
[1] 0.75

weights: 166
initial value 359.373389
iter 10 value 187.748041
iter 20 value 148.328123
...
iter 300 value 83.535810
iter 310 value 83.535033
iter 320 value 83.534372
iter 330 value 83.533847
final value 83.533695
converged

mean(train_predictions3 == glass_train$Type)
[1] 0.9195402

mean(test_predictions3 == glass_test$Type)
[1] 0.85

## Predicating Handwriting Digits

This is a very interesting example. Many books have used this data set to show how an NN model is trained and tested for predicting handwriting digits in solving a classification problem. As deep learning gets a lot of attention these days, you might see this data set is used to show how deep learning works and can be easily learned in some tutorials (for example, tensorflow from Google).

Each handwriting digit is essentially an image. In this example, each image is represented by a 28-pixel by 28-pixel matrix of values in either 0 or 1, where 0 is white and 1 is black. Each observation is saved as a vector by rasterizing the matrix from right to left and top to bottom as shown in Fig. 10.3.1. Hence, in the data set of observations each of them has 28x28 = 784 feature values. The training data set contains 60000 digits, which can be then considered as a list of 60000 indexed matrices (Fig. 10.3.2). Correspondingly, there is a list of 60000 indexed labels as shown in Fig. 10.3.3.

![](https://i.imgur.com/BFOl6D2.png)

For this example, you can visualize the handwritings from the data set. Table 10.3.1 shows the snippet that helps you see what the data set indeed has. The plotted results are provided in Fig. 10.3.4, which displays 10 digits. Please change the number of images you want by playing with this module.

```r
read_idx_image_data <- function(image_file_path) {
  con <- file(image_file_path, "rb")
  magic_number <- readBin(con, what = "integer", n=1, size=4, endian="big")
  n_images <- readBin(con, what = "integer", n=1, size=4, endian="big")
  n_rows <- readBin(con, what = "integer", n=1, size=4, endian="big")
  n_cols <- readBin(con, what = "integer", n=1, size=4, endian="big")
  n_pixels <- n_images * n_rows * n_cols
  pixels <- readBin(con, what = "integer", n=n_pixels, size=1, signed = F)
  image_data <- matrix(pixels, nrow = n_images, ncol= n_rows * n_cols, byrow=T)
  close(con)
  return(image_data)
}

read_idx_label_data <- function(label_file_path) {
  con <- file(label_file_path, "rb")
  magic_number <- readBin(con, what = "integer", n=1, size=4, endian="big")
  n_labels <- readBin(con, what = "integer", n=1, size=4, endian="big")
  label_data <- readBin(con, what = "integer", n=n_labels, size=1, signed = F)
  close(con)
  return(label_data)
}

mnist_train <- read_idx_image_data("./mnist/train-images.idx3-ubyte")
mnist_train_labels <- read_idx_label_data("./mnist/train-labels.idx1-ubyte")

display_digit <- function(image_vector, title = "") {
  reflected_image_matrix <- matrix(image_vector, nrow = 28, ncol = 28)
  image_matrix <- reflected_image_matrix[,28:1]
  gray_colors <- seq(from = 1, to = 0, by = -1/255)
  image(image_matrix, col = gray(gray_colors), xaxt='n', yaxt='n', main = title, bty="n")
}

num_images <- 10
par(mar=c(0,0,0,0))
layout(matrix(1:num_images, 1, num_images, byrow = TRUE))
sapply(1:num_images,function(x) display_digit(mnist_train[x,],mnist_train_labels[x]))
```

![The first 10 digits in the training set|400](https://i.imgur.com/PAMfEnT.png)

The text provides steps for the model training in great detail. Therefore, please read the text carefully and follow the steps to try out the example. Here simply emphasizes a few issues you might encounter when you train the models.

Table 10.3.2 shows how long it might take to get a model trained on my personal computer (Table 10.3.2). The first model with 100 hidden neurons took 2280.64 seconds or about 38 minutes on my computer to complete the training. The second model with 300 hidden neurons took 9468.5 seconds or about 158 minutes to get trained. Depends on your computer, it might take longer or shorter. You should be patient! On the right top in Fig. 10.3.5, you see a red “Stop” sign. When it is on, it simply means that the model is still under training (or computing).

```r
####################################################
# Process MNIST
####################################################

mnist_input <- mnist_train / 255
mnist_output <- as.factor(mnist_train_labels)

set.seed(252)
mnist_index <- sample(1:nrow(mnist_input),nrow(mnist_input))
mnist_data <- mnist_input[mnist_index,1:ncol(mnist_input)]
mnist_out_shuffled <- mnist_output[mnist_index] # Sort the output as well

#if this is your first time to use RSNNS, you have to install the package
install.packages("RSNNS")

library("RSNNS")
mnist_out <- decodeClassLabels(mnist_out_shuffled)
mnist_split <- splitForTrainingAndTest(mnist_data, mnist_out, ratio = 0.2)
mnist_norm <- normTrainingAndTestSet(mnist_split, type = "0_1")

start_time <- proc.time()
mnist_mlp <- mlp(mnist_norm$inputsTrain, mnist_norm$targetsTrain, size=100, inputsTest=mnist_norm$inputsTest, targetsTest=mnist_norm$targetsTest)
proc.time() - start_time
```

    user   system  elapsed

995.007 3.897 2156.271

```r
start_time <- proc.time()
mnist_mlp2 <- mlp(mnist_norm$inputsTrain, mnist_norm$targetsTrain, size=300, inputsTest=mnist_norm$inputsTest, targetsTest=mnist_norm$targetsTest)
proc.time() - start_time
```

     user    system   elapsed

2918.091 26.838 34209.535

```r
mnist_class_test <- (0:9)[apply(mnist_norm$targetsTest,1,which.max)]
mlp_class_test <- (0:9)[apply(mnist_mlp$fittedTestValues,1,which.max)]
mlp2_class_test <- (0:9)[apply(mnist_mlp2$fittedTestValues,1,which.max)]

confusionMatrix(mnist_class_test, mlp2_class_test)
```

A confusion matrix can be used to check how the train model performs. Table 10.3.3 is the confusion matrix for Model 2 with 300 hidden neurons when the MNIST test data is used to check how the model was built. The accuracy seems very high, indicating a very good model that has been built.

       predictions

targets 0 1 2 3 4 5 6 7 8 9
0 1166 0 1 2 0 0 4 0 3 2
1 0 1295 5 1 2 1 2 5 1 1
2 4 3 1159 4 4 0 3 8 3 1
3 3 0 11 1214 1 5 0 5 7 3
4 0 3 3 0 1148 0 2 0 0 5
5 5 3 0 4 0 1063 7 1 3 3
6 5 1 2 0 3 6 1175 0 2 0
7 0 5 6 2 1 0 1 1242 2 5
8 3 4 2 10 1 3 5 2 1127 4
9 4 1 0 2 10 1 0 4 3 1177

```r
par(mar=c(2,4,2,2))
layout(matrix(1:2, 2, 1, byrow = TRUE))
plotIterativeError(mnist_mlp, main = "Iterative Error for 100 Neuron MLP Model")
legend("topright", c("Training Data", "Test Data"), col=c("black", "red"), lwd=c(1,1))
plotIterativeError(mnist_mlp2, main = "Iterative Error for 300 Neuron MLP Model")
legend("topright", c("Training Data", "Test Data"), col=c("black", "red"),lwd=c(1,1))

plotROC(mnist_mlp2$fittedTestValues[,2],mnist_norm$targetsTest[,2], main="ROC Curve for 300 Neuron MLP Model (Digit 1)", xlab="1 - Specificity", ylab = "Sensitivity")
abline(a = 0, b = 1, lty=2)
legend("bottomright", c("Model", "Random Classifier"), lty = c(1,2), lwd=c(1,1))
```

The following figures in the text are printed in black. So I have them included here as the following figures (that are generated from Table 10.3.4) might be useful for you to compare the results with yours. As stated in the text book, the models are very good in terms of their prediction accuracies.

![400](https://i.imgur.com/f5bV8b4.png)

![400](https://i.imgur.com/sjm3pkj.png)
