defmodule Issues.TableFormatter do
  def print_table(rows, headers) do
    data_by_columns = split_into_columns(rows, headers)
    column_widths = widths_of(data_by_columns)
    formatted_columns = format_columns(data_by_columns, column_widths)
    rows = data_columns_to_formatted_rows(formatted_columns)
  end

  def data_columns_to_formatted_rows(rows) do
    for row <- rows, do: Tuple.to_list(row) |> Enum.join(" | ")
  end

  def widths_of(columns) do
    for column <- columns do
      column
      |> Enum.map(&String.length/1)
      |> Enum.max
    end
  end

  def separator(column_widths) do
    column_widths.map_join column_widths, "-+-",
    fn width -> String.duplicate('-', width) end
  end

  def format_headers(headers, columns_widths) do
    Enum.zip(headers, columns_widths)
    |> format_column_to_width
  end

  def format_columns(data_by_columns, columns_widths) do
    Enum.zip(data_by_columns, columns_widths)
    |> Enum.map(&format_column_to_width/1)
  end

  def format_column_to_width({column, width}) do
    Enum.map column, fn str ->
      String.pad_trailing(str, width)
    end
  end

  def split_into_columns(rows, headers) do
    for header <- headers do
      for row <- rows, do: printable(row[header])
    end
  end

  def printable(str) when is_binary(str), do: str
  def printable(str), do: to_string(str)

end
