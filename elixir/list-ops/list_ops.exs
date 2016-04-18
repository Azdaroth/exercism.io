defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]) do
    0
  end

  @spec count(list) :: non_neg_integer
  def count([_ | tail]) do
    1 + count(tail)
  end

  @spec reverse(list) :: list
  def reverse(list) do
    do_reverse(list, [])
  end

  @spec do_reverse([], list) :: list
  defp do_reverse([], accum) do
    accum
  end

  @spec do_reverse(list, list) :: list
  defp do_reverse([head | tail], accum) do
    do_reverse(tail, [head | accum])
  end

  @spec map(list, (any -> any)) :: list
  def map(list, func) do
    reverse(do_map(list, func, []))
  end

  @spec do_map([], (any -> any), list) :: list
  defp do_map([], _, accum) do
    accum
  end

  @spec do_map(list, (any -> any), list) :: list
  defp do_map([head | tail], func, accum) do
    do_map(tail, func, [func.(head) | accum])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, func) do
    reverse(do_filter(list, func, []))
  end

  @spec do_filter([], (any -> as_boolean(term)), list) :: list
  defp do_filter([], _, accum) do
    accum
  end

  @spec do_filter(list, (any -> as_boolean(term)), list) :: list
  defp do_filter([head | tail], func, accum) do
    if func.(head) do
      do_filter(tail, func, [head | accum])
    else
      do_filter(tail, func, accum)
    end
  end

  @type accum :: any
  @spec reduce([], accum, ((any, accum) -> accum)) :: accum
  def reduce([], accum, _) do
    accum
  end

  @spec reduce(list, accum, ((any, accum) -> accum)) :: accum
  def reduce([head | tail], accum, func) do
    reduce(tail,  func.(head, accum), func)
  end

  @spec append(list, list) :: list
  def append(final_list, []) do
    final_list
  end

  @spec append([], list) :: list
  def append([], final_list) do
    final_list
  end

  @spec append(list, list) :: list
  def append(append_from_list, append_to_list) do
    do_append(reverse(append_from_list), append_to_list)
  end

  @spec do_append([], list) :: list
  def do_append([], final_list) do
    final_list
  end

  @spec do_append(list, list) :: list
  def do_append([head | tail], append_to_list) do
    do_append(tail, [head | append_to_list])
  end

  @spec concat([[any]]) :: [any]
  def concat(list_with_lists) do
    do_concat(reverse(list_with_lists), [])
  end

  @spec do_concat([], list) :: list
  defp do_concat([], accum) do
    accum
  end

  @spec do_concat([[any]], list) :: list
  defp do_concat([head | tail], accum) do
    do_concat(tail, append(head, accum))
  end
end
