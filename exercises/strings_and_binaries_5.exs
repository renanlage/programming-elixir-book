defmodule StringsAndBinaries5 do
  def center(strings) do
    lengths = strings |> Enum.map(&String.length/1)
    max_length = lengths |> Enum.max

    strings
    |> Enum.zip(lengths)
    |> Enum.map(fn { string, length } ->
      _pad({string, length}, max_length - length)
    end)
  end

  defp _pad({string, length}, amount) do
    left_padding = div(amount, 2)
    right_padding = amount - left_padding

    string
    |> String.pad_leading(length + left_padding)
    |> String.pad_trailing(length + left_padding + right_padding)
  end
end


IO.puts(["cat", "zebra", "prisão louça"] |> StringsAndBinaries5.center == ["    cat     ", "   zebra    ", "prisão louça"])
IO.puts(["cat", "zebra", "elephant"] |> StringsAndBinaries5.center == ["  cat   ", " zebra  ", "elephant"])
