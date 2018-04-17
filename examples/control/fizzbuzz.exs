defmodule FizzBuzz do
  def upto(n) do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  def fizzbuzz(n), do: _fizzbuzz(n, rem(n, 3), rem(n, 5))

  defp _fizzbuzz(_n, 0, 0), do: "FizzBuzz"
  defp _fizzbuzz(_n, 0, _), do: "Fizz"
  defp _fizzbuzz(_n, _, 0), do: "Buzz"
  defp _fizzbuzz(n, _, _), do: n
end

IO.puts(FizzBuzz.upto(20) == [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17, "Fizz", 19, "Buzz"])
