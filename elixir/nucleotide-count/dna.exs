defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if Enum.member?(@nucleotides, nucleotide) do
      histogram(strand)[nucleotide]
    else
      raise ArgumentError
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    if Enum.any?(strand, fn nucleotide -> !Enum.member?(@nucleotides, nucleotide) end) do
      raise ArgumentError
    else
      strand
      |> Enum.reduce(default_histogram, &count_nucleotide/2)
    end
  end

  @spec default_histogram() :: map
  defp default_histogram do
    Enum.map(@nucleotides, fn nucleotide -> {nucleotide, 0} end) |> Enum.into(%{})
  end

  @spec count_nucleotide(char, map) :: map
  defp count_nucleotide(nucleotide, accum) do
    current_count = Map.get(accum, nucleotide, 0)
    new_count = current_count + 1
    Map.put(accum, nucleotide, new_count)
  end
end
