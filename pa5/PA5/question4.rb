# Louis Romeo
# CSC 372
# PA5 Question 4

# prints out the largest palindromic number that is the product of a two-digit number and a three-digit number
def is_palindrome?(number)
  number.to_s == number.to_s.reverse
end

largest_palindrome = 0

(10..99).each do |i|
  (100..999).each do |j|
    product = i * j
    if is_palindrome?(product) && product > largest_palindrome
      largest_palindrome = product
    end
  end
end

puts "The largest palindromic number is #{largest_palindrome}"