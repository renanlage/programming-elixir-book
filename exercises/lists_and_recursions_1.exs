defmodule MyList do
  def mapsum([], _func), do: 0
  def mapsum([head|tail], func), do: func.(head) + mapsum(tail, func)
end

defmodule MyListAccumulator do
  def mapsum([list], func), do: _mapsum(list, func, 0)

  defp _mapsum([], _, total), do: total
  defp _mapsum([head|tail], func, total) do
     _mapsum(tail, func, func.(head) + total)
  end
end

IO.puts(MyList.mapsum([], &(&1 * 2)) == 0)
IO.puts(MyList.mapsum([2, 3], &(&1 * 2)) == 10)
IO.puts(MyListAccumulator.mapsum([], &(&1 * &1)) == 0)
IO.puts(MyListAccumulator.mapsum([20], &(&1 * &1)) == 400)
IO.puts(MyListAccumulator.mapsum([10, 15], fn x -> x * x end) == 325)
