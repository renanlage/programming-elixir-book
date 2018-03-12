defmodule StringCalculator do
  def calculate(charlist) do
    [num1, op, num2] = charlist
    |> to_string
    |> String.split

    _apply_operator(String.to_integer(num1), op, String.to_integer(num2))
  end

  defp _apply_operator(number1, "-", number2), do: number1 - number2
  defp _apply_operator(number1, "+", number2), do: number1 + number2
  defp _apply_operator(number1, "*", number2), do: number1 * number2
  defp _apply_operator(number1, "/", number2), do: number1 / number2
end

defmodule StringCalculatorCheater do
  def calculate(str), do: _calculate(str, 0)

  defp _calculate([], value), do: value
  defp _calculate([?\s | tail], value), do: _calculate(tail, value)

  defp _calculate([digit | tail], value)
    when digit in '0123456789',
    do: _calculate(tail, value * 10 + digit - ?0)

  defp _calculate([operator | tail], value)
    when operator in '+-*/',
    do: apply(Kernel, List.to_atom([operator]), [value, calculate(tail)])
end

IO.puts(StringCalculator.calculate('100 + 10') == 110)
IO.puts(StringCalculator.calculate('100 - 10') == 90)
IO.puts(StringCalculator.calculate('100 * 10') == 1000)
IO.puts(StringCalculator.calculate('100 / 10') == 10)

IO.puts(StringCalculatorCheater.calculate('100 + 10') == 110)
IO.puts(StringCalculatorCheater.calculate('100 - 10') == 90)
IO.puts(StringCalculatorCheater.calculate('100 * 10') == 1000)
IO.puts(StringCalculatorCheater.calculate('100 / 10') == 10)
