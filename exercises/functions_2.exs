fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, c) -> c
end
IO.puts fizzbuzz.(0, 0, 5) == "FizzBuzz"
IO.puts fizzbuzz.(0, 5, 5) == "Fizz"
IO.puts fizzbuzz.(5, 0, 5) == "Buzz"
IO.puts fizzbuzz.(5, 5, 10) == 10
