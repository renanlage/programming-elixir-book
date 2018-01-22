list_concat = fn([a, b], [c, d]) -> [a, b, c, d] end
IO.puts list_concat.([:a, :b], [:c, :d]) == [:a, :b, :c, :d]

sum = fn(a, b, c) -> a + b + c end
IO.puts sum.(1, 2, 3) == 6

pair_tuple_to_list = fn({ a, b }) -> [a, b] end
IO.puts pair_tuple_to_list.( { 1234, 5678 } ) == [ 1234, 5678 ]
