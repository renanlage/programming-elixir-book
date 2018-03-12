defmodule StringsAndBinaries do
  def is_ascii?(string) do
    string
    |> Enum.all?(&(&1 >= ?\s && &1 <= ?~))
  end

  def anagram?(word1, word2) do
    _count_letter_occurrences(word1) == _count_letter_occurrences(word2)
  end

  def anagram_cheat?(word1, word2) do
    word1_list = String.to_charlist(word1)
    word2_list = String.to_charlist(word2)
    (word1_list -- word2_list) == '' && (word2_list -- word1_list) == ''
  end

  defp _count_letter_occurrences(word) do
    word
    |> String.graphemes
    |> Enum.reduce(%{}, fn(letter, occurrences) ->
      Map.update(occurrences, letter, 0, &(&1 + 1))
    end)
  end
end

IO.puts(StringsAndBinaries.is_ascii?(' asd ? ~12312%#$') == true)
IO.puts(StringsAndBinaries.is_ascii?([0, 0, 7, 9999999]) == false)
IO.puts(StringsAndBinaries.is_ascii?('') == true)

IO.puts(StringsAndBinaries.anagram?("renan", "naner") == true)
IO.puts(StringsAndBinaries.anagram?("girafa ", "fa gira") == true)
IO.puts(StringsAndBinaries.anagram?("", "") == true)
IO.puts(StringsAndBinaries.anagram?("girafa ", "fa gira") == true)
IO.puts(StringsAndBinaries.anagram?("renan", "naners") == false)
IO.puts(StringsAndBinaries.anagram?("asd", "1231axc") == false)

IO.puts(StringsAndBinaries.anagram_cheat?("renan", "naner") == true)
IO.puts(StringsAndBinaries.anagram_cheat?("girafa ", "fa gira") == true)
IO.puts(StringsAndBinaries.anagram_cheat?("", "") == true)
IO.puts(StringsAndBinaries.anagram_cheat?("girafa ", "fa gira") == true)
IO.puts(StringsAndBinaries.anagram_cheat?("renan", "naners") == false)
IO.puts(StringsAndBinaries.anagram_cheat?("asd", "1231axc") == false)
