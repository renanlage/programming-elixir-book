defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from + 1, to)]
end

defmodule MyListTailCall do
  def span(from, to), do: _span(from, to, [])

  def _span(from, to, list) when from > to, do: list
  def _span(from, to, list), do: _span(from, to - 1, [to | list])
end

IO.puts(MyList.span(1, 1) == [1])
IO.puts(MyList.span(1, 2) == [1, 2])
IO.puts(MyList.span(2, 5) == [2, 3, 4, 5])
IO.puts(MyList.span(5, 2) == [])
IO.puts(MyListTailCall.span(1, 1) == [1])
IO.puts(MyListTailCall.span(1, 2) == [1, 2])
IO.puts(MyListTailCall.span(2, 5) == [2, 3, 4, 5])
IO.puts(MyListTailCall.span(5, 2) == [])
