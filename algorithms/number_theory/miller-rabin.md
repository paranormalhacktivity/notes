# Miller-Rabin Primality Test

## Overview
- Type: Probabilistic primality testing
- Objective: Determine whether a given number is composite or probably prime.
- Named After: Mathematicians Gary L. Miller and Michael O. Rabin.

## Key Ideas
1. Fermat's Little Theorem:
  - If p is a prime number and a is any positive integer less than p, then
    a^p-1 = 1 (mod p)
2.  Testing for Composites:
  - If n is an odd prime number, then for any a not divisible by n, either
    a^n-1 = 1 (mod n) or a^(2^8(n-1)) = -1 (mod n) for some s.
  - If neither of these conditions holds, n is composite.

## Algorithm Steps
1. Write n - 1 as 2^8 * d where d is an odd number.
  - Keep dividing n - 1 by 2 until you get an odd number d.
2. Pick a random integer a such that 2 <= a <= n - 2.
3. Compute a^d (mod n).
  - If a^d = 1 (mod n), n may be prime (but further iterations are needed).
  - If a^(2^r*d) = -1 (mod n) for some r from 0 to s - 1, n may be prime.
4. Repeat the test for a number of randomly chosen a values.
  - The more iterations, the higher the confidence in the result.

## Conclusion
- If the algorithm declares n as prime, it is likely to be correct.
- If the algortighm declares n as composite, it is definitely correct.
- Probability of Error: The probability of a false positive (declaring a composite
  number as prime) decreases exponentially with the number of iterations.

## Applications
- Cryptography: Primality testing is a crucial step in various cryptographic protocols,
  such as RSA.

## Implementation Note
- Choosing a: Randomly choosing a for each iteration is common. Alternatively, deterministic
  choices can be made based on number theory.

Miller-Rabin is probabilistic (it may occasionally give a false positive), its reliability
increases with more iterations. It is widely used in practice due to its efficiency and
effectiveness.

## Time Complexity
The time complexity of the Miller-Rabin primality testing algorithm depends on the number
of iterations performed. Let's denote k as the number of iterations. For each iteration,
the algorithm involves modular exponentiation, which can be done efficiently using algorithms
like square-and-multiply.

Let's breakdown the complexity:
1. Modular Exponentiation: if m is the number of bits in the binary representation of n,
   then the time complexity of modular exponentiation is O(m^3) using the square-and-multiply
   algorithm.
2. Number of Iterations: The time complexity increases linearly with the number of iterations,
   denoted as k.

Therefore, the overall time complexity of the Miller-Rabin algorithm is approximately
O(k*m^3). The choice of k influences the accuracy of the algorithm; a larger k generally
increases the confidence in the result but also increases the computational cost.

In practice, the Miller-Rabin algorithm is often used with a fixed
number of iterations (e.g. k = 10) to balance efficiency and accuracy. Keep in mind that
while the algorithm is probabilistic, the probability of a false positive (declaring a composite
number as prime) decreases exponentially with the number of iterations.

## Code Example
```ruby
def square_and_multiply(base, exponent, mod)
  result = 1
  base = base % mod

  while exponent > 0
    if exponent.odd?
      result = (result * base) % mod
    end

    exponent = exponent >> 1
    base = (base * base) % mod
  end

  return result
end

def miller_rabin_test(n, k)
  return false if n <= 1
  return true if n == 1 || n == 3

  # Write n - 1 as 2^s * d
  s, d = 0, n - 1
  while d.even?
    s += 1
    d /= 2
  end

# Perform k iterations
  k.times do
    a = 2 + rand(n - 3)
    x = square_and_multiply(a, d, n)

    next if x == 1 || x == n - 1

    (s - 1).times do
      x = square_and_multiply(x, 2, n)
      return false if x == n -1
    end

    return false if x != n - 1
  end

  true
end

# Example usage
number_to_test = 23
iterations = 5
if miller_rabin_test(number_to_test, iterations)
  puts "#{number_to_test} is probably prime"
else
  puts "#{number_to_test} is composite"
end
```
