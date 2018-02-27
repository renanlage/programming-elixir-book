defmodule MyListDumb do
  def flatten([]), do: []
  def flatten([head | tail]) do
    flatten(head) ++ flatten(tail)
  end
  def flatten(head), do: [head]
end

defmodule MyListSmart do
  def flatten(list) when is_list(list), do: _flatten(list, [])

  defp _flatten([], acc), do: acc
  defp _flatten([head | tail], acc) do
    _flatten(head, _flatten(tail, acc))
  end
  defp _flatten(head, acc), do: [head | acc]
end

IO.puts(MyListDumb.flatten([1,[2,[3,[4]]],[5],6]) == [1,2,3,4,5,6])
IO.puts(MyListDumb.flatten([]) == [])
IO.puts(MyListDumb.flatten([1,2,3,4]) == [1,2,3,4])
IO.puts(MyListDumb.flatten(2) == [2])
IO.puts(MyListSmart.flatten([1,[2,[3,[4]]],[5],6]) == [1,2,3,4,5,6])
IO.puts(MyListSmart.flatten([]) == [])
IO.puts(MyListSmart.flatten([1,2,3,4]) == [1,2,3,4])
# Throws error: IO.puts(MyListSmart.flatten(2) == [2])
