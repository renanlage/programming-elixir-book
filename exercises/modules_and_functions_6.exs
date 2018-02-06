defmodule Chop do
  def guess(actual, range) do
    try(actual, halfway(range), range)
  end

  defp halfway(first..last), do: div(last - first, 2) + first

  defp try(actual, actual, _), do: IO.puts actual

  defp try(actual, guessed, first.._) when guessed > actual do
    IO.puts("It is #{guessed}")
    guess(actual, first..guessed-1)
  end

  defp try(actual, guessed, _..last) when guessed < actual do
    IO.puts("It is #{guessed}")
    guess(actual, guessed+1..last)
  end
end

Chop.guess(273, 1..1000)
