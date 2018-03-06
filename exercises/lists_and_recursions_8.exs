defmodule TaxNaive do
  def apply_taxes(orders, tax_rates) do
    _apply_taxes(orders, tax_rates, [])
  end

  defp _apply_taxes([], _tax_rates, applied), do: Enum.reverse(applied)

  defp _apply_taxes([order = [id: _, ship_to: state, net_amount: net] | orders], tax_rates, applied) do
    if tax_rates[state] == nil do
      order = [total_amount: net] ++ order
      _apply_taxes(orders, tax_rates, [order | applied])
    else
      tax = tax_rates[state] * net
      total_amount = net + tax
      order = [total_amount: total_amount] ++ order
      _apply_taxes(orders, tax_rates, [order | applied])
    end
  end
end

defmodule TaxMap do
  def apply_taxes(orders, tax_rates) do
    orders |> Enum.map(&(_apply_tax_to_order(&1, tax_rates)))
  end

  defp _apply_tax_to_order(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax = net * tax_rate
    total = net + tax
    [total_amount: total] ++ order
  end
end


orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount: 50.00 ]
]
tax_rates = [ NC: 0.075, TX: 0.08 ]
expected_1 = [
  [total_amount: 107.5, id: 123, ship_to: :NC, net_amount: 100.0],
  [total_amount: 35.5, id: 124, ship_to: :OK, net_amount: 35.5],
  [total_amount: 25.92, id: 125, ship_to: :TX, net_amount: 24.0],
  [total_amount: 48.384, id: 126, ship_to: :TX, net_amount: 44.8],
  [total_amount: 26.875, id: 127, ship_to: :NC, net_amount: 25.0],
  [total_amount: 10.0, id: 128, ship_to: :MA, net_amount: 10.0],
  [total_amount: 102.0, id: 129, ship_to: :CA, net_amount: 102.0],
  [total_amount: 53.75, id: 130, ship_to: :NC, net_amount: 50.0]
]
expected_2 = Enum.map(orders, &([total_amount: &1[:net_amount]] ++ &1))

IO.puts(TaxNaive.apply_taxes(orders, tax_rates) == expected_1)
IO.puts(TaxNaive.apply_taxes([], tax_rates) == [])
IO.puts(TaxNaive.apply_taxes(orders, []) == expected_2)

IO.puts(TaxMap.apply_taxes(orders, tax_rates) == expected_1)
IO.puts(TaxMap.apply_taxes([], tax_rates) == [])
IO.puts(TaxMap.apply_taxes(orders, []) == expected_2)
