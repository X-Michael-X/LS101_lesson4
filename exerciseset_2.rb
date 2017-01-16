# Exercise 1

# For each of these collection objects demonstrate how you would reference 
# the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, 
        {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)

# Exercise 2

# For each of these collection objects where the value 3 occurs, demonstrate 
# how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

# Exercise 3

# Given this code, what would be the final values of a and b? Try to work 
# this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

a = 2
b = [3, 8]

# Exercise 4

# Using the each method, write some code to output all of the vowels 
# from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], 
       fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'
all_letters = hsh.values.flatten.join.chars
all_letters.each do |letter|
    puts letter if vowels.include?(letter)
  end
  
# Exercise 5

# Given this data structure, return an new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate) 
# in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |ele|
  ele.sort.reverse
end

# Exercise 6

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the 
# original but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new_hash = {}
  hash.each do |key, value|
      new_hash[key] = value + 1
  end
  new_hash
end

# Exercise 7

# Given the following data structure use a combination of methods, including 
# either the select or reject method, to return a new array identical in 
# structure to the original but containing only the integers that are 
# multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |array|
    array.select{|ele| ele % 3 == 0}
end

# Exercise 8

# Given the following data structure, and without using the Array#to_h method, 
# write some code that will return a hash where the key is the first item in 
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = {}
arr.each do |array|
  hash[array[0]] = array[1]
  end
  
# Exercise 9

#Given the following data structure, return a new array containing same 
# sub-arrays as the original but ordered logically according to the numeric 
# value of the odd integers they contain.
  
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |array|
    array.select do |num|
        num.odd?
    end
end

# Exercise 10

# Given this data structure write some code to return an array containing the 
# colors of the fruits and the sizes of the vegetables. The sizes should be 
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

# Exercise 11

# Given this data structure write some code to return an array which contains 
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, value|
    value.all? do |num|
        num.even?
    end
  end
end

# Exercise 12

# Given this data structure, and without using the Array#flatten method, write 
# some code to return a new array containing all of the items in the original 
# array but in a flat structure.

arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]

# One Way
step2 = []
step3 = []
def flat(array, reciever)
  array.each do |ele|
    if ele.kind_of?(Array)
      ele.each do |word|
        reciever << word
      end
    else
      reciever << ele
    end
  end
end

flat(arr, step2)
flat(step2, step3)
step3

# Another Way
arr.each_with_object([]) do |ele, new_arr|
  if ele.kind_of?(Array)
      ele.each do |item|
        if item.kind_of?(Array)
          item.each do |word|
            new_arr << word
          end
        else
          new_arr << item
        end
      end
  else
      new_arr << ele
  end
end






