defmodule MyEnum do
  def all?(list, func \\ fn x -> x end)
  def all?([], _func), do: true
  def all?([x], func), do: !!func.(x)
  def all?([head | tail], func), do: !!func.(head) && all?(tail, func)
end

IO.puts(MyEnum.all?([true, 1, "something"]) == true)
IO.puts(MyEnum.all?([0, false, ""]) == false)
IO.puts(MyEnum.all?([true, 1, "something"], fn x -> !x end) == false)
IO.puts(MyEnum.all?([true, false, "something"]) == false)
IO.puts(MyEnum.all?([]) == true)


defmodule MyEnumTailCall do
  def all?(list, func \\ fn x -> x end) do
    _all?(list, func, true)
  end

  defp _all?([], _func, all_true), do: all_true
  defp _all?([head | tail], func, all_true) do
    _all?(tail, func, all_true && !!func.(head))
  end
end

IO.puts(MyEnumTailCall.all?([true, 1, "something"]) == true)
IO.puts(MyEnumTailCall.all?([0, false, ""]) == false)
IO.puts(MyEnumTailCall.all?([true, 1, "something"], fn x -> !x end) == false)
IO.puts(MyEnumTailCall.all?([true, false, "something"]) == false)
IO.puts(MyEnumTailCall.all?([]) == true)
