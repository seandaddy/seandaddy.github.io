---
publishDate: 2025-03-13T00:00:00Z
title: "Neural Networks"
excerpt: "Artificial Neurons"
category: "Programming"
tags: ["economics"]
---

## Artificial Neurons

Consider the following data in Fig. 1.1 that are used to identify team members for playing basketball. In the scatterplot, assume that persons marked in blue who are not good candidates (true negatives) and in red who are good candidates (true positives) for the team. As you can see, both weight and height influence the decision we make in choosing the candidates. This is a typical classification problem with two input variables (or features) and one output variable (target).

![Scatterplot of data for potential basketball players|400](https://i.imgur.com/GNUpxj9.png)

Based on what we have learned so far, we can easily grow a decision tree to model this problem. As shown in Fig 9.1.2, the tree has three leaf nodes and its accuracy can be calculated as follows:

Accuracy1=(125+36+23)/192=95.83%

![Pruned decision tree|400](https://i.imgur.com/gtXC2oz.png)

Intuitively, one way to increase the accuracy is to split more on the decision nodes. Fig. 9.1.3 shows the results from the decision tree without pruning. The number of leaf nodes is increased from three to six leading to a more complex model (although it tends to become overfitting for a test data set). However its accuracy stays the same:

Accuracy2=(5+120+18+5+6+30)192=95.83%

![Decision tree using default setting without pruning|400](https://i.imgur.com/pPMndSb.png)

As we discussed in Lesson7, a decision tree partitions the feature space of a data set into a series of distinct regions in dimensions, which consists of hyper-cubes or planes that are essentially parallel to dimension axes. Once again, a two-dimension space can be easily visualized as shown in Fig. 9.1.4. The space gets split more (as illustrated in Fig. 9.1.3 and Fig. 9.1.4(b)), the reduction in entropy is minimal or inexistent. That means that despite the fact that we have more nodes, data points are not separable.

A decision tree generates a good result but the question is: **Can we get better results?** If you analyze the data in Fig. 9.1.4, although it is separable, the separation line (as shown in Fig. 9.1.4 in green) is not parallel to any input axis. In other words, if we could find the equation of this green line, we would separate the two classes with a better accuracy. Therefore, a new solution to answer this proposed question is what we explore in this lesson.

![Decision tree using default setting without pruning|400](https://i.imgur.com/k6OrC17.png)

In a human brain, each neuron has the job of collecting from and transmitting signals to other neurons. Neurons are activated when the input signals are sufficiently large and, in such case, it sends a spike of signal to the next neuron along the chains (forming a neural network). Artificial neural networks are computer models that attempt to mimic how the human brain functions with the empowerment of neurons. Before we look into artificial neural networks (ANN), we need some basic understating of artificial neurons. Note that the simplest ANN (containing a single neuron) is termed as a perceptron, which is shown in Fig. 9.1.5.

![Illustration of an artificial neuron (Copyright © Packt Publishing)|400](https://i.imgur.com/xDoG7bh.png)

As discussed in the textbook (Forte, 2015), a computation neuron can be illustrated as one shown in Fig. 9.1.5. This single computational neuron is the simplest example of a neural network.  The output function, $y$, of this simple neuron can be formally formulated as follows:

$y=g\left( w_{0}+ \sum_{i=1}^{n} w_{i}x_{i} \right)$

The function $g()$ in the neural network is called an activation function. For example, an activation function could be chosen as a step function:

$$g(x') = \begin{cases} -1, & x' < 0 \\ 1, & x' \geq 0 \end{cases}$$
The output function can also be simplified as:

$y=g\left( \sum_{i=0}^{n} w_{i}x_{i} \right)$,where,$x_{0}=1$

The above-mentioned basketball player candidates’ problem can be formulated using neural networks. Although individual data records (e.g., observations or measures) were not given, here we simply provide a developed computational neural network (or model) that can solve the problem well:

$Y_{0}=w_{1}⋅Weight+w_{2}⋅Height+w_{0}⋅1$

or

$Y_{0}=1⋅Weight+46.67⋅Height−420⋅1$

$$Y = \begin{cases} -1, & Y_{0} < 0 \\ 1, & Y_{0} \geq 0 \end{cases}$$

This model is exactly the equation of the ideal separation line in the basketball player data. From Fig. 9.1.6, we find that $Y_{0}$ can be passed through a "Hard limiter" or activation function to separate the two classes.

![Illustration of a developed artificial neuron (a simplest neural network)|400](https://i.imgur.com/NjoTUFW.png)

In summary, artificial neurons (or formed networks) can be well adopted for predictive modeling. The question is how we can learn the “best” weights and activation functions as shown in the simple example illustrated in Fig. 9.1.6. As a result, we could improve the results in predictive modeling as expected.

## Neural Networks

In general, a typical artificial neural network is composed of a collection of perceptrons grouped in layers: input, hidden, and output. Several hidden layers can be placed between the input and output layers. Figure 9.2.1 shows a network with four (4) layers. The input layer contains the same number of nodes as the number of input variables (or features). The network contains only two hidden layers with eight hidden nodes in total while the output layer contains two nodes. If there is only one node as the output, the network is suitable for binary classification (True/false) problems. For multi-class classification the output layer must contain a number of nodes equal to the number of classes. To avoid overfitting, the number of nodes/layers in the network must be kept as low as possible. Choosing too few nodes in the hidden layer will lead to underfitting. Typical values for the nodes in the hidden layer range from 2/3 to twice the number of nodes in the input layer arranged in less than two hidden layers. These values are provided for guidance and the ultimate network structure should be determined by trials and errors (i.e., iterations of training and evaluation).

![Illustration of an artificial neural network (Copyright © Packt Publishing)|400](https://i.imgur.com/Itq4NFX.png)

Training an artificial neural network involves processing records (i.e., observations) from the training data set one at a time and comparing the result of the ANN to the true class value as shown in Figure 9.2.2. For each of the misclassified records, the network is adjusted by feeding back the errors into the network to adjust the weights of the connections between the neurons. The process is repeated until (1) a required level of accuracy is achieved or (2) a specified number of iterations are performed. To avoid overfitting, the network must be tested/confirmed on a test data set.

![Procedure for training an artificial neural network|400](https://i.imgur.com/jmPg6Zs.png)

Once again, it will be easier for us to explain how we can develop an ANN model if a simple scenario is used. Hence, we would take a look at a single perceptron (which is the simplest neural network) again and study how we could train it for the “BEST” result.

To put it simply, identifying appropriate weights and activation functions in an ANN model is what we have to do. For a training model, we use a cost function to interpret how much we miss, $\sum_{i=1}^{n}(\hat{y_{i}}−y_{i})^2$.  Hence, the “BEST” result of an ANN will be its output function with appropriate weights, which generates a minimal cost.

Stochastic gradient descent is a stochastic approximation of the gradient descent optimization method for minimizing such a cost function. In other words, stochastic gradient descent can help find minima through iterations or step-by-step learning/training. Below we briefly discuss how step-by-step learning/training is implemented in neural networks.

To find optimal objective function, the cost function can be defined as follows:

$$\frac{1}{2n}\sum_{i=1}^{n}(\hat{y_{i}}−y_{i})^2$$

Please refer to the text book (Forte, 2015), the following equations can be obtained for optimizing the results:

$$J(\overrightarrow{w}) = \frac{1}{2n}\sum_{i=1}^{n}\left( \left(\sum_{j=1}^{P}w_{j}x_{j}\right)−y_{i} \right)^2$$

$$\frac{\partial J(\overrightarrow{w})}{\partial w_{k}} = \frac{1}{n}\sum_{i=1}^{n}\left( \left(\sum_{j=1}^{P}w_{j}x_{j}\right)−y_{i} \right)x_{ik}$$
$$\frac{\partial J(\overrightarrow{w})}{\partial w_{k}} = \frac{1}{n}\sum_{i=1}^{n}(\hat{y_{i}}−y_{i})x_{ik}$$

In other words, to find a better weight (which leads to a lower cost), we could adjust it a little $(\hat{y_{i}}−y_{i})x_{ik}$ at each iteration. Hence, for a particular value of the weight vector, gradient descent finds the direction in which the gradient of the cost function is steepest, and adjusts the weights in that direction by a small amount. When a model is under training in practice, stochastic gradient descent updates a particular weight, $w_k$, when processing the i th observation in the data set according to the following equation:

$$w_{k} \leftarrow w_{k} - \eta (\hat{y_{i}}−y_{i})x_{ik} $$

where $\eta$ is the learning rate. This is essentially the implementation of the pocket perceptron algorithm. $\eta$ as the learning rate can be easily changed as needed.

We can use a simple scenario to show how the above algorithm is used to train a model. Table 9.2.1 is a snippet in R that can generate a binary dataset. Its scatterplot is shown in Fig. 9.2.3.

```r
####################################################
# Perceptron
####################################################

# Creating sample Data (as a training data set):
set.seed(12345)
x1 = runif(300, 0, 10)
set.seed(54321)
x2 = runif(300, 0, 10)
x = cbind(x1,x2)
y = sign(8.68 - 0.96*x[,1] - 0.89*x[,2])


# Plot the sample model
a_pop = -8.68/-0.89
b_pop = -0.96/0.89

p <- ggplot(data = NULL, aes(x=x1, y=x2, shape = ifelse(y > 0, "Class 1","Class -1")))
p <- p + geom_point()
p <- p + ggtitle("Sample Data Model - Binary")
p <- p + theme(plot.title = element_text(lineheight=.8, face="bold", vjust=2), legend.position="bottom")
p <- p + xlab("x1")
p <- p + ylab("x2")
p <- p + scale_shape_manual(name="Class Labels", values=c(1,15))
p <- p + geom_abline(intercept = a_pop, slope = b_pop, aes(linetype="Population Line"), linewidth = 0.5, show.legend=T)
p <- p + scale_linetype_manual(name = "Decision Boundaries", values = c("dashed","solid"))
p <- p + guides(shape = guide_legend(override.aes = list(linetype = 0 )),
                linetype = guide_legend())
p
```

![Figure 9.2.3. Scatterplot of the Sample Data Model|400](https://i.imgur.com/ovivCib.png)

Table 9.2.2 is the R implementation of the above discussed pocket perceptron algorithm (Forte, 2015). In Table 9.2.2, pmodel = pocket_perceptron(x,y,0.2,1000) calls the algorithm, in which stochastic gradient descent as a stochastic approximation of the gradient descent optimization method is adopted. It generates a final model after it iterates 1000 times as shown in Table 9.2.3. Once again, the learning rate can be adjusted as needed. The result from the trained model seems great as it is illustrated in Fig. 9.2.4.

```r
# Algorithm
step_function <- function(x) {
   if (x < 0) -1 else 1
}

pocket_perceptron <- function(x, y, learning_rate, max_iterations) {
  nObs = nrow(x)
  nFeatures = ncol(x)
  w = rnorm(nFeatures+1,0,2) # Random weight initialization
  current_iteration = 0
  has_converged = F
  best_weights = w
  best_error = nObs #Start by assuming you get all the examples wrong
  while ((has_converged == F) & (current_iteration < max_iterations)) {
    has_converged = T # Assume we are done unless we misclassify an observation
    current_error = 0 # Keep track of misclassified observations
    for (i in 1:nObs) {
      xi = c(1,x[i,]) # Append 1 for the dummy input feature x0
      yi = y[i]
      y_predicted = step_function(sum(w*xi))
      if (yi != y_predicted) {
        current_error = current_error + 1
        has_converged = F # We have at least one misclassified example
        w = w + learning_rate*sign(yi-y_predicted)*xi
      }
    }
    if (current_error < best_error) {
      best_error = current_error
      best_weights = w
    }
    current_iteration = current_iteration+1
  }
  model <- list("weights" = best_weights, "converged" = has_converged, "iterations" = current_iteration)
  model
}

pmodel = pocket_perceptron(x,y,0.2,1000)

# Plot
a_pop = -8.68/-0.89
b_pop = -0.96/0.89
a_model = -pmodel$weights[1]/pmodel$weights[3]
b_model = -pmodel$weights[2]/pmodel$weights[3]

p <- ggplot(data = NULL, aes(x=x1, y=x2, shape = ifelse(y > 0, "Class 1","Class -1")))
p <- p + geom_point()
p <- p + ggtitle("Binary Classification with the Perceptron Algorithm")
p <- p + theme(plot.title = element_text(lineheight=.8, face="bold", vjust=2), legend.position="bottom")
p <- p + xlab("x1")
p <- p + ylab("x2")
p <- p + scale_shape_manual(name="Class Labels", values=c(1,15))
p <- p + geom_abline(intercept = a_pop, slope = b_pop, aes(linetype="Population Line"), size = 0.5, show.legend=T)
p <- p + geom_abline(intercept = a_model, slope = b_model, aes(linetype="Model Line"), size = 0.8, show.legend=T)
p <- p + scale_linetype_manual(name = "Decision Boundaries", values = c("dashed","solid"))
p <- p + guides(shape = guide_legend(override.aes = list(linetype = 0 )),
       linetype = guide_legend())
p
```

![Figure 9.2.4. Illustration of a trained model using the perceptron algorithm|400](https://i.imgur.com/VFnzgZh.png)

For advanced learners, please read multilayer perceptron training algorithms in the textbook. Please keep in mind, there are many different training algorithms that are available in academia and practice as of today. For example, recursive neural networks in deep learning have recently drawn a lot of attention from scholars and practitioners worldwide.

## Classification Example - Private College

In this lesson, we show a simple real life classification problem (classified private vs. public college) that can be solved well in R using “neuralnet” package, one of popular packages in R. More examples will be explored in our next lesson.

This problem is based the example provided in kdnuggets.com as indicated in Table 9.3.1. ISLR's built in College Data Set will be used, which has several features of a college and a categorical column indicating the type of colleges, Public or Private. Please keep in mind, in the next lesson, more examples will be explored, showing how ANN models can facilitate predictive modeling in practice for better and improved results when implemented appropriately.

R code below provides steps of training an ANN model for solving the classification problem of college types in the USA. The provided snippet clearly shows how to use the “neuralnet” package, one of popular packages in R. We use 70% data for training, the rest of 30% for testing (to ensure that we won’t get an over-fitted model).

```r
# The following example is from
# http://www.kdnuggets.com/2016/08/begineers-guide-neural-networks-r.html
#
# install.packages('ISLR')
library(ISLR)

print(head(College,5))

# Create Vector of Column Max and Min Values
maxs <- apply(College[,2:18], 2, max)
mins <- apply(College[,2:18], 2, min)

# Use scale() and convert the resulting matrix to a data frame
scaled.data <- as.data.frame(scale(College[,2:18],center = mins, scale = maxs - mins))

# Check out results
print(head(scaled.data,2))

# Convert Private column from Yes/No to 1/0
Private = as.numeric(College$Private)-1
data = cbind(Private,scaled.data)

# install.packages('caTools')
library(caTools)
set.seed(101)

# Create Split (any column is fine)
split = sample.split(data$Private, SplitRatio = 0.70)

# Split based off of split Boolean Vector
train = subset(data, split == TRUE)
test = subset(data, split == FALSE)

feats <- names(scaled.data)

# Concatenate strings
f <- paste(feats,collapse=' + ')
f <- paste('Private ~',f)

# Convert to formula
f <- as.formula(f)

f

# install.packages('neuralnet')
library(neuralnet)
nn <- neuralnet(f,train,hidden=c(10,10,10),linear.output=FALSE)

# Compute Predictions off Test Set
predicted.nn.values <- compute(nn,test[2:18])

# Check out net.result
print(head(predicted.nn.values$net.result))

predicted.nn.values$net.result <- sapply(predicted.nn.values$net.result,round,digits=0)

table(test$Private,predicted.nn.values$net.result)
```

                                        [,1]

Adrian College 1
Alfred University 1
Allegheny College 1
Allentown Coll. of St. Francis de Sales 1
Alma College 1
Amherst College 1

      0   1

0 55 9
1 6 163

The above example shows that an ANN model can have an accuracy at about 94% for the test data set. If you would like to try CART algorithm while using the same split data, you probably would get an accuracy at about 93%.
