# Counting Sort

## Overview
Counting sort is a simple and efficient algorithm for sorting a list of items, given
that the items have a small range of possible values. It works by creating a "counting array"
that keeps track of the number of times each value appears in the input list.

# How it works
1) Create a counting array of size `k`, where `k` is the range of possible values for the items
   in the input list. Initialize each element in the array to 0.
2) Iterate through the input list and increment the count for each value in the counting array.
   For example, if the input list is [3, 1, 2, 2, 3], then the counting array would be [0, 0, 0, 2, 0].
3) Iterate through the counting array and output the value `k` times, where `k` is the
   count for that value. For example, if the counting array is [0, 0, 0, 2, 0], then
   the output list would be [3, 3, 2, 2].

## Simple explanation
Imagine that you have a bunch of toy cars, and you want to sort them by color. One way to do
this is to use the counting sort.

First, you would create a "counting array" with one slot for each color of toy car. Then, you
would look at each toy car and put it in the slot for its color. For example, if you have
two red cars, one blue car, and three yellow cars, then your counting would look like this:

```
red     blue     yellow
2        1         3
```

Next, you would go through the counting array and put out the toy cars in the order of the
colors. For example, if you go through the array in this order: red, blue, yellow, the your
toy cars would be sorted like this:

```
red car  red car  blue car  yellow car  yellow car  yellow car
```

That's counting sort! It's a simple way to sort things by counting how many of each thing
you have and putting them out in the right order.

## Time complexity
Counting sort has a time complexity of `O(n + k)`, where `n` is the number of items in
the input list and `k` is the range of possible values. This makes it an efficient algorithm
for sorting lists where the range of possible values is small relative to the number of items
in the list. However, it is not suitable for sorting listss where the range of possible values
is large, since the size of the counting array would be prohibitively large in that case.

## Code example
```ruby
# Define a method for counting sort.
# The input_list parameter is the list of items to be sorted, and the k parameter is the range of possible values for the items in the list.
def counting_sort(input_list, k)
  # Create a counting array of size k, where k is the range of possible values for the items in the input list.
  # Initialize each element in the array to 0.
  counting_array = Array.new(k, 0)

  # Iterate through the input list and increment the count for each value in the counting array.
  input_list.each do |value|
    counting_array[value] += 1
  end

  # Iterate through the counting array and output the value k times, where k is the count for that value.
  output_list = []
  counting_array.each_with_index do |count, value|
    count.times do
      output_list << value
    end
  end

  # Return the sorted list of items.
  return output_list
end

# Test the counting sort implementation with a sample input list.
input_list = [3, 1, 2, 2, 3]
puts counting_sort(input_list, k=5)  # Should print [1, 2, 2, 3, 3]
```
