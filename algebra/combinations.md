# Combinations("n choose k")

Combinations are a fundamental concept in combinatorial mathematics that deal with
counting the number of ways to select `k` items from a set of `n` items, without
considering the order of selection. In mathematical notation, this is often represented
as "n choose k", denoted as `C(n, k)`.

## Formula
The formula for combintions is given by:
```
C(n, k) = n! / (k! * (n - k)!)
```

Where:
- `C(n, k)` represents the number of ways to choose `k` items from a set of `n` items.
- `n!` is the factoria of `n`, which is the product of all positive integers from 1 to `n`
- `k!` is the factorial of `k`, which is the product of all positive integeres from 1 to `k`
- `(n - k)!` is the factorial of the difference between `n` and `k`

## Explanation:
The formula for combinations calcualtes the number of distinct subsets of size `k` that
can be selected from a larger set of `n` items. Unlike permutations that result from
rearranging the same set of `k` items.

For example, combinations are used in scenarios such as:
- Selecting a committee from a group of individuals.
- Choosing a subset of items from a large collection.
- Counting the number of ways to form certain patterns or arrangements.

## Conclusion
Combinations, represented as "n choos k" or `C(n, k)`, provide a structured approach
to counting the number of ways to select items from a set without considering their order.
The formula involves factorials and is a cornerston of combinatorial mathematics, forming
the basis for problems involving selection and arrangement in various fields.
