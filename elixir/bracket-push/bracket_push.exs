defmodule BracketPush do
  @opening_brackets ["{", "[", "("]
  @closing_brackets ["}", "]", ")"]
  @all_brackets @opening_brackets ++ @closing_brackets
  @closing_opening_brackets_mapping Enum.zip(@closing_brackets, @opening_brackets) |> Enum.into(%{})
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(string) do
    opening_brackets_from_string = string
                                  |> extract_brackets(:opening)
                                  |> sort_descending_by_index
    closing_brackets_from_string = string
                                  |> extract_brackets(:closing)

    if Enum.count(opening_brackets_from_string) != Enum.count(closing_brackets_from_string) do
      false
    else
      opened_closed_properly?(opening_brackets_from_string, closing_brackets_from_string)
    end
  end

  @spec sort_descending_by_index(list) :: list
  defp sort_descending_by_index(brackets_with_indexes) do
    brackets_with_indexes
    |> Enum.sort(fn ({_, idx1}, {_, idx2}) -> idx1 > idx2 end)
  end

  @spec opened_closed_properly?(list, list) :: boolean
  defp opened_closed_properly?([], []) do
    true
  end

  @spec opened_closed_properly?(list, list) :: boolean
  defp opened_closed_properly?(remaining_openings, remaining_closings) do
    {closing_bracket, closing_index} = first_closed = Enum.at(remaining_closings, 0)
    closest_opening = Enum.find(remaining_openings,
      fn {bracket, index} -> bracket == opening_bracket_for(closing_bracket) && index < closing_index end
    )
    if closest_opening do
      {_, opening_index} = closest_opening
      if sum_of_indexes_even?(closing_index, opening_index) do
        false
      else
        opened_closed_properly?(
          remaining_openings -- [closest_opening],
          remaining_closings -- [first_closed]
        )
      end
    else
      false
    end
  end

  # if sum of indexes of opening and closing bracket is even then something between is not balanced
  @spec sum_of_indexes_even?(Integer.t, Integer.t) :: boolean
  defp sum_of_indexes_even?(closing_index, opening_index) do
    rem(closing_index + opening_index, 2) == 0
  end

  @spec extract_brackets(String.t, atom) :: list
  defp extract_brackets(string, type) do
    split_brackets = string
    |> String.split("", trim: true)
    |> take_brackets_only
    |> Enum.with_index
    case type do
      :opening -> split_brackets |> Enum.filter(&opening_bracket?/1)
      :closing -> split_brackets |> Enum.filter(&closing_bracket?/1)
    end
  end

  @spec take_brackets_only(list) :: list
  defp take_brackets_only(list_of_characters) do
    list_of_characters
    |> Enum.filter(fn char -> Enum.member?(@all_brackets, char) end)
  end

  @spec opening_bracket?(tuple) :: boolean
  defp opening_bracket?({char, _}) do
    Enum.member?(@opening_brackets, char)
  end

  @spec closing_bracket?(tuple) :: boolean
  defp closing_bracket?({char, _}) do
    Enum.member?(@closing_brackets, char)
  end

  @spec opening_bracket_for(String.t) :: String.t
  defp opening_bracket_for(closing_bracket) do
    @closing_opening_brackets_mapping[closing_bracket]
  end
end
