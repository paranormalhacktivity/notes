# Linear Regression
A statistical technique used to find the relationship between variables. In machine
learning, linear regression finds the relationship between features and a label.

Example: Suppose we want to predict a car's fuel efficiency in miles per gallon based
on how heavy the car is, and we have the following dataset:

--------------------------------------------------------------------------------
|     Pounds in 1000s(feature)          |            Miles per gallon(label)   |
--------------------------------------------------------------------------------
|                 3.5                   |                      18              |
--------------------------------------------------------------------------------
|                 3.69                  |                      15              |
--------------------------------------------------------------------------------
|                 3.44                  |                      18              |
--------------------------------------------------------------------------------
|                 3.43                  |                      16              |
--------------------------------------------------------------------------------
|                 4.34                  |                      15              |
--------------------------------------------------------------------------------
|                 4.42                  |                      14              |
--------------------------------------------------------------------------------
|                 2.37                  |                      24              |
--------------------------------------------------------------------------------

The above datapoints could be plotted on a graph, where x = "Pounds in 1000s(Feature)" and
y = "Miles per Gallon(Label)", which would ultimately show that as a car gets heavier,
its miles per gallon rating gradually decreases. A best fit line can be drawn throught
the data on the chart.

In algebraic terms, the model would be defined as y = mx + b, where
- y is the miles per gallon - the value we want
- m is the slope of the line
- x is pounds - our input value
- b is the y-intercept

In ML, the equation would be written slightly different, the equation for the linear
regression model would be defined as y' = b + w₁x₁, where
- y' is the predicted label - the output
- b is the bias of the model. Bias is the same concept as the y-intercept in the algebraic
equation for a line. In ML, bias is sometimes referred to as w₀. Bias is a parameter of the
model and is calculated during training.
- w₁ is the weight of the feature. Weight is the same concept as the slope m in the algebraic
equation for a line. Weight is a parameter of the model and is calculated during training.
- x₁ is a feature - the input

Additional note: both b(bias) and w₁(weight) are calculated from training.

Given the miles per gallon example, to calculate the weight and bias from the linear
regression line, the bias is 34, as that is where the line crosses the y-axis, and
the weight is -4.6, as that is the slope of the line. Therefore the model would be
defined as y' = 34 + (-4.6)(x₁) and that model could used to make predictions. For instance,
if the car being evaluated was a 4000-pound car, we could predict a fuel efficiency of
15.6 miles per gallon. i.e. y' = 34 + (-4.6)(4.0)

## Models with multiple features
The example, up to this point, uses only one feature, heaviness of a car, however,
a more sophisticated model might rely on multiple features, each having a separate
weight (w₁, w₂, etc.). For instance, a model that relies on five features would be
written as such...

y' = b + w₁x₁ + w₂x₂ + w₃x₃ + w₄x₄ + w₅x₅

...and additional features that model might use, may include...
- Engine Displacement
- Acceleration
- Number of Cylinders
- Horsepower

If these additional features were plotted in their own graphs, they would also
have a linear relationship to the label, miles per gallon.
