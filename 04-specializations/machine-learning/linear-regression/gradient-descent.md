# Gradient Descent
A mathematical technique that iteratively finds the weights and bias that produce
the model with the lowest loss. Gradient descent finds the best weight and bias by
repeating the following process for a number of user-defined iterations.

The model begins training with randomized weights and biases near zero, then repeats
the following steps:
    1. Calculate the loss with the current weight and bias.
    2. Determine the direction to move the weights and bias that reduce loss.
    3. Move the weight and bias values a small amount in the direction that reduced loss.
    4. Return to step one and repeat the process until the model can't reduce the loss any further.

## Math behind Gradient Descent

### Dataset
-------------------------------------------------------------------------------
|  Pounds in 1000s (feature)            |    Miles per Gallon (label)         |
-------------------------------------------------------------------------------
| 3.5                                   | 18                                  |
-------------------------------------------------------------------------------
| 3.69                                  | 15                                  |
-------------------------------------------------------------------------------
| 3.44                                  | 18                                  |
-------------------------------------------------------------------------------
| 3.43                                  | 16                                  |
-------------------------------------------------------------------------------
| 4.34                                  | 15                                  |
-------------------------------------------------------------------------------
| 4.42                                  | 14                                  |
-------------------------------------------------------------------------------
| 2.37                                  | 24                                  |
-------------------------------------------------------------------------------

### Calculation
1. The model starts training by setting the weight and bias to zero:
    weight = 0
    bias = 0

    y = 0 + 0(x₁)

2. Calculate the MSE loss with the current model parameters:
   Loss = ((18 - 0)² + (15 - 0)² + (18 - 0)² + (16 - 0)² + (15 - 0)² + (14 - 0)² + (24 - 0)²) / 7

   Loss = 303.71

3. Calculate the slope of the tangent to the loss function at each weight and the bias:

   To get the slope for the lines tangent to weight and bias, take the derivative of the
   loss function with respect to the weight and the bias, and then solve the equations.

   Write the equation for making a prediction as: `f(w,b)(x) = (w * x) + b

   Calculate the MSE using: (1/M) Σ (i=1 to M) (f_w,b(xᵢ) - yᵢ)²
   where `i` represents the `ith` training example and `M` represents the number of examples.

   *Weight Derivative:*

   The derivative of the loss function with respect to the weight is written as:
   d/dw [ (1/M) Σ (i=1 to M) (f_w,b(xᵢ) - yᵢ)² ]

   and evaluates to:
   (1/M) Σ (i=1 to M) (f_w,b(xᵢ) - yᵢ) * 2xᵢ

   First sum each predicted value minus the actual value and then multiply it by two
   times the feature value. Then divide the sum by the number of examples. The result
   is the slope of the line tangent to the value of the weight.

   Solving the equation with a weight and bias equal to zero, the line slope is -119.7

   *Bias Derivative:*

   The derivative of the loss function with respect to the bias is written as:
   d/db [ (1/M) Σ (i=1 to M) (f_w,b(xᵢ) - yᵢ)² ]

   and evaluates to:
   (1/M) Σ (i=1 to M) (f_w,b(xᵢ) - yᵢ) * 2

   First sum each predicted value and then multiply it by two. Then divide the sum
   by the number of examples. The result is the slope of the line tangent to the value
   of the bias.

   Solving the equation with a weight and bias equal to zero, the line slope is -34.3

   *Results:*
   weight slope = -119.7
   bias slope = -34.3

4. Move a small amount in the direction of the negative slope to get the next weight and bias.
   As an example, an arbitrarily small amount can be defined, such as 0.01:

   New weight = old weight - (small amount * weight slope)
   New bias = old bias - (small amount * bias slope)

   New weight = 0 - (0.01) * (-119.7)
   New bias = 0 - (0.01) * (-34.3)

   New weight = 1.2
   New bias = 0.34
