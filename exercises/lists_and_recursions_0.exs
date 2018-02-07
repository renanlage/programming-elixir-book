defmodule MyList do
  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)

  def reduce([], value, _), do: value
  def reduce([head|tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end

defmodule MyListAccumulator do
  def sum(list), do: _sum(0, list)

  defp _sum(total, []), do: total
  defp _sum(total, [head|tail]), do: _sum(total + head, tail)
end

IO.puts(MyList.sum([]) == 0)
IO.puts(MyList.sum([20]) == 20)
IO.puts(MyList.sum([10, 1, 15]) == 26)

IO.puts(MyListAccumulator.sum([]) == 0)
IO.puts(MyListAccumulator.sum([20]) == 20)
IO.puts(MyListAccumulator.sum([10, 1, 15]) == 26)

IO.puts(MyList.reduce([1, 2, 3, 4], 100, &(&1 + &2)) == 110)
IO.puts(MyList.reduce([1, 2, 3, 4], 1, fn(x, acc) -> acc * x end) == 24)
