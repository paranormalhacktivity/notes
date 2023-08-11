# Order of Operations(PEMDAS/BODMAS)

"Please Excuse My Dear Aunt Sally"

...or...

"Brody Orders Donuts Monday And Saturday"

The Order of Operations provides us with a set of hierarchical rules, in which we
should use to solve an expression with multiple operations. The following are the
order of operations, as they should be performed:

1. Parentheses/Brackets: Perform operations withing parentheses or brackets first. Work innermost to outermost, if nested.
  - Example: `3 * (2 + 5) = 3 * 7 = 21`
2. Exponent/Orders: Evaluate exponents(orders/powers/indices) next.
  - Example: `2^3 + 2 = 2^3 + 2 = 2 * 2 * 2 + 2 = 18`
3. Multiplication/Division: Perform multiplication and division from left to right.
  - Example: `8 / 2 * 4 = 4 * 4 = 16`
4. Addition/Subtraction: Finally, perform addition and subtraction from left to right.
  - Example: `10 - 3 + 5 = 7 + 5 = 12`

There has been much debate on the internet and social media about the correct order of operations,
this is often due to a common misguiding from within the education system. Funny enough, the
misguiding is mainly in part due to the acronyms "PEMDAS", which is commonly taught in the
US and "BODMAS", which is commonly taught in the UK. The arguments often boils down to
"what comes first, multiplication or division?", those who learned PEMDAS tend to argue that
multiplication comes first, while those who learned BODMAS tend to argue that division actually
comes first. Both ideas, in reality, are wrong. Multiplication and division are within the same
tier of the hierarchy and should be performed according to the sequence of left to right.

## Practice Problems
- Evaluate: 3 * (4 + 7) - 2^2
   1. perform parenthetical operations: 3 * 11 - 2^2
   2. evaluate exponents: 3 * 11 - 4
   3. perform multiplication: 33 - 4
   4. subtract: 29

   Answer: `29`

- Simplify: 10 / (2 + 3) * 2^2 - 5
  1. perform parenthetical operations: 10 / 5 * 2^2 - 5
  2. evaluate exponents: 10 / 5 * 4 - 5
  3. divide, then multiply: 2 * 4 - 5 = 8 - 5
  4. subtract: 3

  Answer: `3`

- Solve: (6 - 2) * 4 + 9 / 3
  1. perform parenthetical operations: 4 * 4 + 9 / 3
  2. multiply, then divide: 16 + 9 / 3 = 16 + 3
  3. add: 18

  Answer: `18`
