# Louis Romeo
# CSC 372
# PA5 Question 1

# repeatedly takes in a year and determines if it is a leap year or not
def leap_year(year)
  if year % 400 == 0
    return true
  elsif year % 100 == 0
    return false
  elsif year % 4 == 0
    return true
  else
    return false
  end
end

loop do
  puts "Give me a year or type 0 to quit."
  input = gets.chomp.to_i
  break if input == 0
  if leap_year(input)
    puts "#{input} is a leap year."
  else
    puts "#{input} is not a leap year."
  end
end