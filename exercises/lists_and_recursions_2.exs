defmodule MyList do
  def max([]), do: nil
  def max([head|tail]), do: _max(tail, head)

  defp _max([], greatest), do: greatest
  defp _max([head|tail], greatest) when head > greatest do
     _max(tail, head)
  end
  defp _max([_head|tail], greatest) do
     _max(tail, greatest)
  end
end

defmodule MyListCheater do
  def max([]), do: nil
  def max([x]), do: x
  def max([head|tail]), do: Kernel.max(head, max(tail))
end

IO.puts(MyList.max([]) == nil)
IO.puts(MyList.max([1]) == 1)
IO.puts(MyList.max([100, 2, 101, 8, 1000]) == 1000)
IO.puts(MyListCheater.max([]) == nil)
IO.puts(MyListCheater.max([1]) == 1)
IO.puts(MyListCheater.max([100, 2, 101, 8, 1000]) == 1000)
