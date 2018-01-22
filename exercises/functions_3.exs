fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, c) -> c
end

fizzbuzz_solver = fn(n) ->
  fizzbuzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts fizzbuzz_solver.(10)
IO.puts fizzbuzz_solver.(11)
IO.puts fizzbuzz_solver.(12)
IO.puts fizzbuzz_solver.(13)
IO.puts fizzbuzz_solver.(14)
IO.puts fizzbuzz_solver.(15)
IO.puts fizzbuzz_solver.(16)
