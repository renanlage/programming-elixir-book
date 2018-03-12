handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end
IO.puts handle_open.(File.open("first_steps/file.txt"))
IO.puts handle_open.(File.open("nonexistent"))
