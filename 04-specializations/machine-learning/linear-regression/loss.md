# Loss
The numerical metric that describes how wrong a model's predictions are. Loss measures the
distance between the model's predictions and the actual labels. The goal of training is
to minimize the loss, reducing it to its lowest possible point.

## Distance of loss
In statistics and machine learning, loss measures the difference between the predicted
and actual values. Loss focuses on the distance between the values, not the direction.
For example, if a model predicts 2, but the actual value is 5, the fact that the loss
is negative (2 - 5 = -3) is not important. Instead, the important thing to note is
that the distance is 3. This means that all methods for calculating loss remove the
negative sign.

The two most common are:
1. Take the absolute value of the difference between the actual value and the prediction.
2. Square the difference between the actual value and the prediction.

## Types of Loss
In linear regression, there are four main types of loss...

1. Loss type: L₁ loss ("loss")
   Definition: The sum of the absolute values of the difference between the predicted values and the actual values
   Equation: Σ|actual value - predicted value|

2. Loss type: Mean Absolute Error (MAE)
   Definition: The average of L₁ losses across a set of \*N\* examples.
   Equation: (¹⁄ₙ)Σ|actual value - predicted value|

3. Loss type: L₂ loss ("squared loss")
   Definition: The sum of the squared difference between the predicted values and the actual values
   Equation: Σ(actual value - predicted value)²

4. Loss type: Mean Squared Error (MSE)
   Definition: The average of L₂ losses across a set of \*N\* examples.
   Equation: (¹⁄ₙ)Σ(actual value - predicted value)²

The functional difference between L₁ and L₂ loss (or between MAE and MSE) is squaring. When
the difference between the prediction and label is large, squaring makes the loss even larger.
When the difference is small (less than 1), squaring makes the loss even smaller.
When processing multiple examples at once, it is recommended to average the losses across all the
examples whether using MAE or MSE

## Calculating loss example
Calculate L₂ loss using the best fit line: y' = 34 + (-4.6)(x₁)

Weight: -4.6
Bias: 34

If the model predicts that a 2,370-pound car gets 23.1 miles per gallon, but it actually
gets 26 miles per gallon, the calculation for L₂ loss would be as follows:

--------------------------------------------------------------------------------
|       Value         |         Equation                    |    Result        |
--------------------------------------------------------------------------------
|   Prediction        |  bias + (weight * feature value)    |         23.10    |
|                     |  34 + (-4.6 * 2.37)                 |                  |
--------------------------------------------------------------------------------
|   Actual value      |  label                              |         26.00    |
--------------------------------------------------------------------------------
|   L₂ loss           |  (actual value - predicted value)²  |          8.41    |
|                     |  (26 - 23.1)²                       |                  |
--------------------------------------------------------------------------------

The L₂ loss for this for this single data point example is 8.41.

## Choosing a loss
Deciding whether to use MAE or MSE can depend on the dataset and the way you want to handle
certain predictions. Most feature values in a dataset typically fall within a distinct
range. For example, cars are normally between 2000 and 5000 pounds and get between
8 to 50 miles per gallon. An 8,000-pound car, or a car that gets 100 miles per gallon,
is outside of the typical range and would be considered an "outlier".

An outlier can also refer to how far off a model's predictions are from the real values. For
instance, 3,000 pounds is within the typical car-weight range, and 40 miles per gallon is
within the typical fuel-efficiency range. However, a 3,000-pound car that gets 40 miles
per gallon would be an outlier in terms of the models prediction because the model would
predict that a 3,000-pound car would get around 20 miles per gallon.

When choosing the best loss function, consider how you want the model to treat outliers. For
instance, MSE moves the model more toward the outliers, while MAE doesn't. L₂ loss incurs
a much higher penalty for an outlier than L₁ loss.

Note the relationship between the model and the data:

    - MSE: The model is closer to the outliers but further away from most of the other data points.

    - MAE: The model is further away from the outliers but closer to most of the other data points.

