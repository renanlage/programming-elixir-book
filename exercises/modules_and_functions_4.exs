defmodule Sum do
  def of(0), do: 0
  def of(n), do: n + of(n-1)
end

defmodule Gcd do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x, y))
end

IO.puts(Sum.of(0) == 0)
IO.puts(Sum.of(1) == 1)
IO.puts(Sum.of(2) == 3)
IO.puts(Sum.of(3) == 6)
IO.puts(Sum.of(4) == 10)

IO.puts(Gcd.of(5, 0) == 5)
IO.puts(Gcd.of(0, 5) == 5)
IO.puts(Gcd.of(48, 18) == 6)
IO.puts(Gcd.of(48, 180) == 12)
IO.puts(Gcd.of(15, 25) == 5)
