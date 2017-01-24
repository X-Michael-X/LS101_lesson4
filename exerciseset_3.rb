# Exercise 1

# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values 
# are the positions in the array.

flintstones.each_with_index.each_with_object({}) do |(ele, index), hash|
  hash[ele] = index
end

# Exercise 2

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, 
         "Marilyn" => 22, "Spot" => 237 }

ages.values.inject(:+)

# Exercise 3

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

ages.select! {|_, value| value < 100}

# Exercise 4

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, 
         "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# Exercise 5

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

Find the index of the first name that starts with "Be"

flintstones.index{|name| name.start_with?('Be')}

# Exercise 6

# Amend this array so that the names are all shortened to just the first 
# three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map!{|name| name[0, 3]}

# Exercise 7

# Create a hash that expresses the frequency with which each letter 
# occurs in this string:

statement = "The Flintstones Rock"

statement.split.join.split('').each_with_object({}) do |letter, hash|
  hash[letter] = statement.scan(letter).count
end

# Exercise 8

# What happens when we modify an array while we are iterating over it? What 
# would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1
# 3
# [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1
# 2
# [1, 2]

# Exercise 9

# As we have seen previously we can use some built-in string methods to 
# change the case of a string. A notably missing method is something provided 
# in Rails, but not in Ruby itself...titleize! This method in Ruby on Rails 
# creates a string that has each word capitalized as it would be in a title. 
# For example, the string:

words = "the flintstones rock"

def titleize(string)
  string.split.map{|word| word.capitalize}.join(' ')
end

# Exercise 10

# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional 
# "age_group" key that has one of three values describing the age group the 
# family member is in (kid, adult, or senior).

munsters.each do |_, value|
  case value["age"]
    when 0..17 then value["age group"] = "kid"
    when 18..64 then value["age group"] = "adult"
    else value["age group"] = "senior"
  end
end

# Exercise 11

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

# figure out the total age of just the male members of the family.

male_age_total = 0
munsters.each do |_, value|
  male_age_total += value["age"] if value["gender"] == "male"
end

male_age_total

# Exercise 12

# One of the most frequently used real-world string properties is that of 
# "string substitution", where we take a hard-coded string and modify it with 
# various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender 
# of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  puts "#{key} is a #{value["age"]} year old #{value["gender"]}."
end

# Exercise 13

# A UUID is a type of identifier often used as a way to uniquely identify 
# items...which may not all be created by the same system. That is, without 
# any form of synchronization, two or more separate computer systems can create 
# new items and label them with a UUID with no significant chance of stepping 
# on each other's toes.

# It accomplishes this feat through massive randomization. The number of 
# possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 
# 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.


def create_uuid
  characters = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)
  sections = [8, 4, 4, 4, 12]
  uuid = ''
  sections.each do |number|
    number.times do
      uuid << characters.sample
      end
    uuid << '-'
  end
  uuid.slice!(-1)
  uuid
end
  
