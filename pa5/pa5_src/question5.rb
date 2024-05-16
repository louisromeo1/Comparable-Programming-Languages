# Louis Romeo
# CSC 372
# PA5 Question 5

# prints out the smallest positive number that is evenly divisible by all the numbers from 1 to 15
def smallest_multiple(range)
  num = range.max  # Start from the largest number in the range
  loop do
    return num if range.all? { |divisor| num % divisor == 0 }
    num += range.max  # Increment by the largest number to optimize the search
  end
end

range = 1..15
result = smallest_multiple(range)

puts "The smallest positive number evenly divisible by all numbers from 1 to 15 is: #{result}"