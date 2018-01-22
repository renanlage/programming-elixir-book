IO.puts Enum.map([1,2,3,4], &(&1 + 2)) == [3,4,5,6]
IO.puts Enum.map [1,2,3,4], &IO.inspect/1
