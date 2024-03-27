# Least Common Multiple(LCM)
The least common multiple(LCM) of two integers `a` and `b` is the smallest positive
integer that is divisible by both `a` and `b`.

## Notation
The LCM of `a` and `b` is denoted as LCM(a, b)

## Properties
1. LCM(a, b) >= max(a, b)
2. If `a` and `b` are coprime(have no common factors other than 1), then LCM(a, b) == a x b

## Calculation
The LCM can be calculated using various methods, with one common approach being based
on the formula using the greatest common divisor(GCD):
```
LCM(a, b) == (a x b)/GCD(a, b)
```

### Example
```
LCM(18, 40) = (18 * 40) / GCD(18 * 40) # 40 = 40 % 18
                                       # 18 = 18 % 4
LCM(18, 40) = (18 * 40) / 2
LCM(18, 40) = 720 / 2
LCM(18, 40) = 360
```

## Prime Factorization Method
Another method for finding the LCM involves prime factorization. Express both numbers
as a product of prime factors and take the highest power of each prime factor present in
either number. This is not the most efficient approach for finding the LCM of two numbers
in all cases, especially when the numbers are relatively large or have many distinct prime
factors.

### Example:
Consider finding the LCM of 12 and 18:
  - Prime factorization of 12: 12 == 2^2 * 3
  - Prime factorization of 18: 18 == 2 * 3^2
  - LCM = 2^2 * 3^2 = 36

## Applications
- Arithmetic operations with fractions: Finding the LCM of denominators to add or
subtract fractions.
- Time-related problems: Finding the LCM of time intervals to determine when events will
coincide or repeat.
- Divisibility tests: Determining if a number is divisible by both `a` and `b` by checking
if it's divisible by LCM(a, b)

## Note
The LCM is a fundamental concept in arithmetic and number theory. Understanding how
to calculate the LCM is essential for various mathematical operations and problem-solving
situations.
