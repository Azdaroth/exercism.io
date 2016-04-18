defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn candidate -> is_anagram_of?(candidate, base) end)
  end

  @spec is_anagram_of?(String.t, String.t) :: boolean
  defp is_anagram_of?(candidate, base) do
   not_the_same_word?(candidate, base) && normalize_string(candidate) == normalize_string(base)
  end

  @spec not_the_same_word?(String.t, String.t) :: boolean
  defp not_the_same_word?(candidate, base) do
    String.downcase(candidate) != String.downcase(base)
  end

  @spec normalize_string(String.t) :: String.t
  defp normalize_string(string) do
    string
    |> String.downcase
    |> String.split("")
    |> Enum.sort
    |> Enum.join
  end
end
