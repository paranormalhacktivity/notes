# Greatest Common Divisor(GCD)
The Greatest Common Divisor(GCD) of two integers `a` and `b` is the largest positive
integer that divides both `a` and `b` without leaving a remainder.

## Notation
The GCD of `a` and `b` is denoted as GCD(a, b).

## Properties
1. GCD(a, b) >= 1
2. if GCD(a, b) == 1, then `a` and `b` are said to be coprime or relatively prime.

## Calculation
The GCD can be calculated using various algorithms, with the most common being the
Euclidian algorithm.

### Euclidean Algorithm
It's an efficient method for finding the GCD of two numbers by repeatedly applying
the division algorith. The algorithm involves dividing the larger number by the smaller
number and replacing the larger number with the remainder until the remainder is zero.
The last nonzero remainder is the GCD.

## Example
Consider finding the GCD of 12 and 18
```
18 = 1,2,3,6,9,18
12 = 1,2,3,4,6,12
GCD(18, 12) = 6

# Euclidian Algorithm
18 = 18 % 12 = 6
12 = 12 % 6 = 0
GCD(18, 12) = 6
```

## Applications
- Simplifying Fractions: Divide both the numerator and the denominator by their GCD
to obtain the simplest form of the fraction.
- Determining Divisibility: If GCD(a, b) = 1, `a` is relatively prime to `b`, and `a`
and `b` have no common factors other than 1.

## Note
The GCD is a fundamental concept in number theory and has practical applications in
various areas of mathematics, including cryptography, algebra, and computer science.
Understanding the GCD allows for efficient manipulation of integers and fractions, as
well as the analysis of number-theoretic properties.
