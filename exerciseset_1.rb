# Exercise 1

# What is the return value of the select method below? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

 # [1, 2, 3] since select modifies its caller based on the truthiness of the
 # block return value. Since 'hi' is truthy and the last line of the block, 
 # select returns a new array based on the truthiness , a new array containing
 # the original values is returned.
 
 # Exercise 2
 
 # How does count treat the block's return value? How can we find out?
 ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# By checking the Ruby Documentation we can see that count returns an integer
# value for the number of elements for which the block returns a true value.

# Exercise 3

# What is the return value of reject? Why?
[1, 2, 3].reject do |num|
  puts num
end

# The return value is [1, 2, 3] because even though puts has a return value of
# nil , reject returns a new array with elements for which the given block is 
# not true. Since nil has a falsey value , we are checking for elements which
# have a value of "not falsey" or true. Since each element in [1, 2, 3] is
# truthy , a new array containing 1, 2, and 3 is returned.

# Exercise 4

# What is the return value of each_with_object? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# The return value will be {'a'=>'ant', 'b' =>'bear', 'c'=>'cat'}. 
# each_with_object  is passed in an object as an argument in this case an empty
# hash. It then executes the code within the block , and returns the argument
# object. In this example our block creates a key value pair from each element
# of the caller. hash[value[0]] becomes our key , and the value becomes the new
# value in the key value pair.

# Exercise 5

# What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift

# By checking the documentation we find that even though hashes dont have an
# really have an index , calling shift on a hash destructively returns what 
# can be thought of as the first key-value pair of the hash as an array. In 
# this case [a:, 'ant'] is returned.

# Exercise 6

# What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size

# 11 is returned because pop destructively returns the last element in the
# array , which is caterpillar. We then call size on caterpillar , which
# returns 11.

# Exercise 7

# What is the block's return value in the following code? How is it determined?
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# since the last last of the block is num.odd? which returns a boolean. the any?
# method iterates through the caller, and returns true if the block ever returns
# a value that is truthy. In this example true is returned, because num.odd?
# evaluates as true for the elements 1 and 3.

# Exercise 8

# How does take work? Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
arr.take(2)

# take returns the first n elements of the caller and is non-destructive.
# sometimes you can tell a destructive method because it ends with a bang(!),
# but not always.Therefore testing the code in irb is an easy way to determine
# if a method is destructive or not.

# Exercise 9

# What is the return value of map? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# According to the documentation, map returns a new array containing the results
# of running the given block on every element in the caller. In this example our
# return is [nil, 'bear'].  Nil is returned because when an if statement
# evaluates to false, nil is the returned value.

# Exercise 10

# What is the block's return value in the following code? Why?
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# The return value will be [1, nil, nil]. When we pass in the first element,
# the if statement is false, and num is what is returned, so 1 is placed into
# our returned array. For the next two elements, num > 1 is true, therefore the
# puts num portion is active.Since we know that the return value for a puts
# statement is nil, nil is what is added into our returned array.

# Exercise 11

# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

arr.sort do |a, b|
  b.to_i <=> a.to_i
end

# Exercise 12

# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', 
  published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysees', author: 'James Joyce', published: '1922'}
]

books.sort_by do |book|
  book[:published]
end