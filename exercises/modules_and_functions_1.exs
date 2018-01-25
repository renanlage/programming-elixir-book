defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(double(n))
end

IO.puts(Times.double(20) == 40)
IO.puts(Times.triple(20) == 60)
IO.puts(Times.quadruple(20) == 80)
