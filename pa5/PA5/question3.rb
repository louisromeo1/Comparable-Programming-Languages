# Louis Romeo
# CSC 372
# PA5 Question 3

# takes in a number N and prints out the sum of the first N even Fibonacci numbers
def even_fibonacci_sum(n)
  if n == 1 # base case
    return 0
  end

  fib_sequence = [0, 2]  # Starting with 0 and 2 as the first two even Fibonacci numbers
  sum = 2  # Initialize sum with 2 because the sequence starts with 0 and 2
  count = 2  # We already have 2 even Fibonacci numbers in the sequence

  while count < n
    next_fib = 4 * fib_sequence[-1] + fib_sequence[-2]  # Generating next even Fibonacci numbers
    fib_sequence << next_fib
    sum += next_fib
    count += 1
  end

  sum
end

puts "Enter a number N: "
n = gets.chomp.to_i
puts "#{even_fibonacci_sum(n)}."