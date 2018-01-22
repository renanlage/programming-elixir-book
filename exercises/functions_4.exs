prefix = fn(first) ->
  fn(second) -> "#{first} #{second}" end
end

mrs = prefix.("Mrs")
IO.puts(mrs.("Smith") == "Mrs Smith")
IO.puts(prefix.("Elixir").("Rocks") == "Elixir Rocks")
