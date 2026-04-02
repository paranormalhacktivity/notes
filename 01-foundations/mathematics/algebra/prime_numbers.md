# Prime Numbers
A "prime number" is a natural number greater than 1 that has exactly two distinct positive divisors.
1. 1
2. Itself

All other numbers greater than 1 that are not prime are called "composite numbers".

Examples of Prime Numbers: 2,3,5,7,11,13,17,19,23,29...

Note:
  - 2 is the only even prime number
  - 1 is not prime, by definition

## Characteristics of Prime Numbers
1. A prime number cannot be factored into smaller natural numbers, except for 1 and itself.
2. All primes(except 2) are odd numbers, because even numbers > 2 are divisible by 2.
3. Primes are building blocks of natural numbers, because any number can be expressed as a product
   of primes (prime factorization).

## Prime Factorization
Every natural number > 1 can be expressed uniquely as a product of prime numbers (ignoring order).

Example: 60 = 2^2 * 3 * 5

2, 3, and 5 are all primes.

## Methods for Testing Primality
Trivial Division: Check divisibility by numbers less than the number itself (commonly up to sqrt n)

Optimized Trial: Check divisibility by primes only (2,3,5,7...)

Advanced Algorithms:
  - Miller-Rabin: Probabilistic, good for large numbers
  - AKS: Deterministic, works in polynomial time.

## Fun Facts
- There are infinitely many prime numbers (proved by Euclid ~300 BC)
- Primes become less frequent as numbers grow, but they never stop.
- Twin Primes: Pairs of primes that differ by 2 (e.g. 11 and 13)
