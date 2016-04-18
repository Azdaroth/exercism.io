defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare([], list) :: atom
  def compare([], [_ | _]) do
    :sublist
  end

  @spec compare(list, []) :: atom
  def compare([_ | _], []) do
    :superlist
  end

  @spec compare(list, list) :: atom
  def compare(comparable_list, absolute_list) when comparable_list == absolute_list do
    :equal
  end

  @spec compare(list, list) :: atom
  def compare(comparable_list, absolute_list) do
    cond do
      Enum.count(comparable_list) < Enum.count(absolute_list) &&
        sublist_from_any_index?(comparable_list, absolute_list) -> :sublist
      Enum.count(comparable_list) > Enum.count(absolute_list) &&
        sublist_from_any_index?(absolute_list, comparable_list) -> :superlist
      true                                                      -> :unequal
    end
  end

  @spec compare(list, []) :: atom
  defp sublist_from_any_index?(_, []) do
    false
  end

  @spec compare([], list) :: atom
  defp sublist_from_any_index?([], _) do
    false
  end

  @spec compare(list, list) :: atom
  defp sublist_from_any_index?(comparable_list, absolute_list = [_ | tail]) do
    cond do
      Enum.count(absolute_list) < Enum.count(comparable_list) -> false
      direct_sublist_of?(comparable_list, absolute_list)      -> true
      true                                                    -> sublist_from_any_index?(comparable_list, tail)
    end
  end

  @spec compare(list, list) :: atom
  defp direct_sublist_of?(comparable_list, absolute_list) do
    comparable_list
    |> Enum.zip(absolute_list)
    |> Enum.all?(fn {n1, n2} -> n1 === n2 end)
  end
end
