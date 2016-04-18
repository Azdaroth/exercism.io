defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(" ")
    |> Enum.map(&take_only_first_letters_of_word_or_capital_letters/1)
    |> Enum.map(&capitalize_each_letter/1)
    |> Enum.join
  end

  defp take_only_first_letters_of_word_or_capital_letters(word) do
    Regex.scan(first_letter_or_capital_letters_pattern, word) |> List.flatten |> Enum.join
  end

  defp first_letter_or_capital_letters_pattern do
    ~r{\b\w|[A-Z]}
  end

  defp capitalize_each_letter(string) do
    String.split(string, "") |> Enum.map(&String.capitalize/1) |> Enum.join
  end
end
