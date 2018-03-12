defmodule ControlFlow.FizzBuzz do
  def upto(n) do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  def fizzbuzz(n) do
    case {n, rem(n, 3), rem(n, 5)} do
      ({_n, 0, 0}) -> "FizzBuzz"
      ({_n, 0, _}) -> "Fizz"
      ({_n, _, 0}) -> "Buzz"
      ({n, _, _}) -> n
    end
  end
end

IO.puts(ControlFlow.FizzBuzz.upto(20) == [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17, "Fizz", 19, "Buzz"])
