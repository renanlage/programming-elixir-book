defmodule Primes do
  defp _span(from, to) when from > to, do: []
  defp _span(from, to), do: [from | _span(from + 1, to)]

  def up_to(n) do
    for x <- _span(2, n),
      is_prime?(x),
      do: x
  end

  def is_prime?(x), do: Enum.all?(_span(2, :math.sqrt(x)), &(rem(x, &1) !== 0))
end

IO.puts(Primes.up_to(40) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37])
