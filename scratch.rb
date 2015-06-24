def fib(n)
  return n if (0..1).include? n
  fib(n-1) + fib(n-2)
end

# puts fib(50)


def fib_it(n)
  first_val = 0
  second_val = 1
  n.times do
    place = first_val
    first_val = second_val
    second_val = place + first_val
  end
  first_val
end
puts fib_it(5)
puts fib_it(6)
puts fib_it(7)
puts fib_it(50)
