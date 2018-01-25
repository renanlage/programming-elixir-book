defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n-1)
end

defmodule Sum do
  def of(0), do: 0
  def of(n), do: n + of(n-1)
end

defmodule Length do
  def of([]), do: 0
  def of([_|tail]), do: 1 + of(tail)
end

IO.puts(Factorial.of(0) == 1)
IO.puts(Factorial.of(1) == 1)
IO.puts(Factorial.of(2) == 2)
IO.puts(Factorial.of(3) == 6)
IO.puts(Factorial.of(4) == 24)

IO.puts(Sum.of(0) == 0)
IO.puts(Sum.of(1) == 1)
IO.puts(Sum.of(2) == 3)
IO.puts(Sum.of(3) == 6)
IO.puts(Sum.of(4) == 10)

IO.puts(Length.of([]) == 0)
IO.puts(Length.of([1]) == 1)
IO.puts(Length.of([9, 1]) == 2)
IO.puts(Length.of([5, 9, 1]) == 3)
IO.puts(Length.of([1, 5, 9, 1]) == 4)
