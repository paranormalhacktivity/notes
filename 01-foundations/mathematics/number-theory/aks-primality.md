# AKS Primality Test

## Overview
- Type: Deterministic primality testing algorithm.
- Objective: Determine whether a given number is prime.
- Named After: It's inventors, Manindra Agrawal, Neeraj Kayal, and Nitin Saxena.

## Key Idea
- Polynomial-Time Primality Testing: AKS is a polynomial-time primality testing algorithm,
  meaning it runs in polynomial time with respect to the number of digits in the input.

## Key Idea
1. Forming the Polynomial: Given an integer n, construct a polynomial f(x) where the
   coefficients are binomial coefficients modulo n.
2. Checking for a Special Form: Check if f(x) has certain properties, indicating
   that n is prime.
3. Exponentiation: Raise f(x) to the power of n, performing the exponentiation in a
   special way to maintain a certain structure.
4. Checking for Congruence: Check if the result of exponentiation is congruent to a
   specific polynomial modulo n.
5. Final Verification: Perform additional checks to verify the primality of n.

## Complexity
- Polynomial Time: AKS is the first primality testing algorithm proven to run in polynomial
  time (specifically, O((log n)^6+ε) for some small ε > 0).

## Significance
- Breakthrough: The AKS primality test is a groundbreaking algorithm as it disproved
  the long-standing belief that primality testing is inherently a problem requiring exponential
  time.
- Theoretical Result: While AKS is not practical for very large numbers due to its high
  complexity, it has theoretical importance in the field of algorithms and complexity theory.

## Limitations
- Not Practical for Large Numbers: Despite being polynomial-time, the AKS algorithm is not
  practival for large numbers compared to probabilistic tests like Miller-Rabin.

## Implementation Note
- Primarily Theoretical: AKS is primarily a theoretical result, and other probabilistic
  algorithms are more commonly used in practice for large numbers.

## Code Example
This code example should be re-examined when there is time to do so. I think there
is more complexity there than what this shows.
```
nomial_coefficient(n, k)
  return 1 if k == 0 || k == n
  binomial_coefficient(n - 1, k - 1) + binomial_coefficient(n - 1, k)
end

def is_prime_power?(n)
  (2..Math.sqrt(n).to_i).each do |a|
    next if n % a != 0

    (2..Math.log(n, a).to_i).each do |k|
      return false if binomial_coefficient(k, n / a) % n != binomial_coefficient(k - 1, n / a) % n
    end

    return true
  end

  true
end

def aks_primality_test(n)
  return "#{n} is prime." if is_prime_power?(n)
  "#{n} is composite."
end

# Example usage
number_to_test = 23
puts aks_primality_test(number_to_test)
```

