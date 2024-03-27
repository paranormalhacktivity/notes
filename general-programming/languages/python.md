# Python
- objects are considered true, unless defined otherwise with the `__bool__()` set to `False` or __len__()` set to `0`
- bool is a subclass of int
- allows for slicing a sequence, while also defining a step ex. [1,2,3,4,5,6][i:j:k] where i is start, j is end, and k is step
- for logical operations, the boolean operators `and`, `or`, and `not` are prefered over `&`, `|`, and `^`
- commas make the tuple, not parenthesis. Parenthesis are optional, except for empty tuple case
- ranges can be defined with a step ex. range(i,j,k) where i is start, j is end, and k is step
- sets are represented as a comma-separated list inside squiggly brackets, or by using the set() constructor
- allows for context manager classes that can be defined using an `__enter__()` and `__exit__()` method, and can be called with `with` and assigned using `as`
- context managers can be useful for scenarios where setup actions are required before code block is ran, and when cleanup is needed afterward
- modules refer to files, not something that is defined in code.
- functions are standalone blocks of code that can be defined and called independently of any particular class or object
- methods are functions that are associated with a particular class, and are defined within the scope of the class
- Python3 removed the concept of unbound methods in favor of defaulting to bound methods
- does not support single-precision floating point numbers, only double-precision floating point numbers

