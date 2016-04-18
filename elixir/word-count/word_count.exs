defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.split(split_by_special_characters_pattern)
    |> Enum.filter(&word_has_only_characters_digits_or_hyphens?/1)
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(%{}, &add_occurence_of_word/2)
  end

  defp split_by_special_characters_pattern do
    :binary.compile_pattern([" ", "!", ",", "_"])
  end

  defp word_has_only_characters_digits_or_hyphens?(word) do
    Regex.match?(~r/[a-zA-Z0-9-]/, word)
  end

  defp add_occurence_of_word(word, histogram) do
    current_count = Map.get(histogram, word, default_count_for_word_when_not_counted_yet)
    new_count = current_count + 1
    Map.put(histogram, word, new_count)
  end

  defp default_count_for_word_when_not_counted_yet do
    0
  end
end
