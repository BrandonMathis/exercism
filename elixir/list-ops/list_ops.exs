defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | t]), do: 1 + count(t)

  @spec reverse(list) :: list
  def reverse(l), do: acc_reverse(l, [])

  def acc_reverse([], acc), do: acc
  def acc_reverse([h | t], acc), do: acc_reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map(l, f), do: map_acc(l, [], f)

  def map_acc([], acc, _f), do: acc
  def map_acc([h | t], acc, f), do: [f.(h) | map_acc(t, acc, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f), do: []
  def filter([h | t], f) do
    cond do
      f.(h) -> [h | filter(t, f)]
      true -> filter(t, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append([h | t], b) do
    [h | append(t, b)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]) do
    append(h, concat(t))
  end
end
