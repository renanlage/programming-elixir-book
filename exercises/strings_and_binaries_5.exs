defmodule StringsAndBinaries5 do
  def center(strings) do
    lengths = strings |> Enum.map(&String.length/1)
    max_length = lengths |> Enum.max

    strings
    |> Enum.zip(lengths)
    |> Enum.map(fn { string, length } ->
      _pad({string, length}, max_length)
    end)
  end

  defp _pad({string, length}, max_length) do
    left_padding = div(max_length - length, 2)

    string
    |> String.pad_leading(length + left_padding)
    |> String.pad_trailing(max_length)
  end
end


IO.puts(["cat", "zebra", "prisão louça"] |> StringsAndBinaries5.center == ["    cat     ", "   zebra    ", "prisão louça"])
IO.puts(["cat", "zebra", "elephant"] |> StringsAndBinaries5.center == ["  cat   ", " zebra  ", "elephant"])
