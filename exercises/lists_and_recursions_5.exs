defmodule MyEnum do
  # all? functions
  def all?(list, func \\ &(!!&1))
  def all?([], _func), do: true
  def all?([head | tail], func), do: !!func.(head) && all?(tail, func)

  # each functions
  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  # split functions
  def split(list, count)
  def split([], _count), do: {[], []}
  def split(list, count) when count <= 0, do: {[], list}
  def split([head | tail], count) do
    {first, second} = split(tail, count - 1)
    {[head | first], second}
  end

  # take functions
  def take(list, amount) when list == [] or amount == 0, do: []
  def take([head | tail], amount) do
    [head | take(tail, amount - 1)]
  end

  # Reverse functions
  def reverse(list), do: _reverse(list, [])
  defp _reverse([], reversed), do: reversed
  defp _reverse([head | tail], reversed), do: _reverse(tail, [head | reversed])
end

IO.puts(MyEnum.all?([true, 1, "something"]) == true)
IO.puts(MyEnum.all?([0, false, ""]) == false)
IO.puts(MyEnum.all?([true, 1, "something"], fn x -> !x end) == false)
IO.puts(MyEnum.all?([true, false, "something"]) == false)
IO.puts(MyEnum.all?([]) == true)

MyEnum.each [1,2,3], &(IO.puts &1 == &1)
MyEnum.each [], &(IO.puts &1 == &1)

IO.puts(MyEnum.take([], 10) == [])
IO.puts(MyEnum.take([1,2,3,4,5,6], 3) == [1,2,3])
IO.puts(MyEnum.take([1,2], 3) == [1,2])
IO.puts(MyEnum.take([1,2], 0) == [])

IO.puts(MyEnum.split([1,2,3,4], 0) == {[], [1,2,3,4]})
IO.puts(MyEnum.split([1,2,3,4], 1) == {[1], [2,3,4]})
IO.puts(MyEnum.split([1,2,3,4], 3) == {[1,2,3], [4]})
IO.puts(MyEnum.split([1,2,3,4], 4) == {[1,2,3,4], []})
IO.puts(MyEnum.split([1,2,3,4], 5) == {[1,2,3,4], []})
IO.puts(MyEnum.split([1,2,3,4], -10) == {[], [1,2,3,4]})


defmodule MyEnumTailCall do
  # all functions
  def all?(list, func \\ fn x -> !!x end) do
    _all?(list, func, true)
  end

  defp _all?([], _func, all_true), do: all_true
  defp _all?([head | tail], func, all_true) do
    _all?(tail, func, all_true && !!func.(head))
  end

  # split functions
  def split(list, count), do: _split([], list, count)
  defp _split(front, tail, count)
    when tail == [] or count <= 0,
    do: {Enum.reverse(front), tail}
  defp _split(front, [head | tail], count) do
    _split([head | front], tail, count - 1)
  end

  # take functions
  def take(list, amount), do: _take(list, amount, [])
  defp _take(list, amount, slice) when list == [] or amount == 0, do: Enum.reverse(slice)
  defp _take([head | tail], amount, slice), do: _take(tail, amount - 1, [head | slice])
end

IO.puts(MyEnumTailCall.all?([true, 1, "something"]) == true)
IO.puts(MyEnumTailCall.all?([0, false, ""]) == false)
IO.puts(MyEnumTailCall.all?([true, 1, "something"], &(!&1)) == false)
IO.puts(MyEnumTailCall.all?([true, false, "something"]) == false)
IO.puts(MyEnumTailCall.all?([]) == true)

IO.puts(MyEnumTailCall.take([], 10) == [])
IO.puts(MyEnumTailCall.take([1,2,3,4,5,6], 3) == [1,2,3])
IO.puts(MyEnumTailCall.take([1,2], 3) == [1,2])
IO.puts(MyEnumTailCall.take([1,2], 0) == [])

IO.puts(MyEnumTailCall.split([1,2,3,4], 0) == {[], [1,2,3,4]})
IO.puts(MyEnumTailCall.split([1,2,3,4], 1) == {[1], [2,3,4]})
IO.puts(MyEnumTailCall.split([1,2,3,4], 3) == {[1,2,3], [4]})
IO.puts(MyEnumTailCall.split([1,2,3,4], 4) == {[1,2,3,4], []})
IO.puts(MyEnumTailCall.split([1,2,3,4], 5) == {[1,2,3,4], []})
IO.puts(MyEnumTailCall.split([1,2,3,4], -10) == {[], [1,2,3,4]})
