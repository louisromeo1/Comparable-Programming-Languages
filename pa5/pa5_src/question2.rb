# Louis Romeo
# CSC 372
# PA5 Question 2

# reads an integer from the user and print the prime factorization of that integer
def prime_factors(n)
  factors = []
  divisor = 2
  while n > 1
    while (n % divisor).zero?
      factors << divisor
      n /= divisor
    end
    divisor += 1
  end
  factors
end

puts "Type a number."
number = gets.chomp.to_i
puts "(" + prime_factors(number).join(")(") + ")"