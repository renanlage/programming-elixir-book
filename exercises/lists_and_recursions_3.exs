defmodule MyList do
  def caesar([], _n), do: []

  def caesar([ head | tail ], n)
    when head+n <= ?z,
    do: [ head+n | caesar(tail, n) ]

  def caesar([ head | tail ], n),
    do: [ head+n-(?z-?a+1) | caesar(tail, n) ]
end

defmodule MyListMap do
  def caesar(list, n) do
    list
      |> Enum.map(&(&1 + n))
      |> Enum.map(&_char_wrap/1)
  end

  defp _char_wrap(char)
    when char > ?z,
    do: char-(?z-?a+1)

  defp _char_wrap(char), do: char
end

IO.puts(MyList.caesar('', 1) == '')
IO.puts(MyList.caesar('abc', 1) == 'bcd')
IO.puts(MyList.caesar('ryvkve', 13) == 'elixir')
IO.puts(MyListMap.caesar('', 1) == '')
IO.puts(MyListMap.caesar('abc', 1) == 'bcd')
IO.puts(MyListMap.caesar('ryvkve', 13) == 'elixir')
