defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string |> Encoder.encode
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string |> Decoder.decode
  end
end

defmodule Encoder do
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> split_into_letters_groups
    |> Enum.map_join(&to_count_with_letter/1)
  end

  defp split_into_letters_groups(string) do
    Regex.scan(pattern_for_splitting_into_consecutive_letters_with_letter, string)
  end

  # e.g. [["wwwwwww", "w"], ["b", "b"]]
  defp pattern_for_splitting_into_consecutive_letters_with_letter do
    ~r{(.)\g1*}
  end

  defp to_count_with_letter([letters, letter]) do
    "#{String.length(letters)}#{letter}"
  end
end

defmodule Decoder do
  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> split_into_counts_with_letters
    |> expand_letters
  end

  defp split_into_counts_with_letters(string) do
    Regex.scan(pattern_for_count_with_letter, string, capture: :all_but_first)
  end

  defp pattern_for_count_with_letter do
    ~r{(\d+)(.)}
  end

  defp expand_letters(counts_with_letters) do
    counts_with_letters
    |> Enum.map_join(fn [count, letter] -> String.duplicate(letter, String.to_integer(count)) end)
  end
end
