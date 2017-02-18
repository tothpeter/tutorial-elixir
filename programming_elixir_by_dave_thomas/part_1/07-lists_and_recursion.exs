defmodule MyList do
  def map([], _fun),           do: []
  def map([head | tail], fun), do: [fun.(head) | map(tail, fun)]

  def sum([]),            do: 0
  def sum([head | tail]), do: head + sum(tail)

  # Tail recursive
  def sum_tr(list),                   do: _sum_tr(list, 0)
  defp _sum_tr([], total),            do: total
  defp _sum_tr([head | tail], total), do: _sum_tr(tail, total + head)

  def reduce(list, acc \\ 0, fun),       do: _reduce(list, acc, fun)
  defp _reduce([], acc, _fun),           do: acc
  defp _reduce([head | tail], acc, fun), do: _reduce(tail, fun.(head, acc), fun)

  def my_max([]), do: nil
  def my_max([x]), do: x
  def my_max([head | tail]), do: max(head, my_max(tail))

  def my_max_tr([]), do: nil
  def my_max_tr([head | tail]), do: _my_max_tr(tail, head)
  defp _my_max_tr([], max_so_far), do: max_so_far
  defp _my_max_tr([head | tail], max_so_far), do: _my_max_tr(tail, max(head, max_so_far))

  def caesar([], _offset), do: []
  def caesar([head | tail], offset) when head + offset > ?z, do: [head + offset - 26 | caesar(tail, offset)]
  def caesar([head | tail], offset), do: [head + offset | caesar(tail, offset)]

  def swap([ a, b | tail ]), do: [ b, a | swap(tail) ]
  def swap([]), do: []
  def swap([item]), do: [item]

  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from + 1, to) ]
end

# IO.inspect MyList.map([1, 2, 3], &(&1 * &1))
# IO.inspect MyList.map([1, 2, 3], &(&1 > 2))

# IO.inspect MyList.sum([1, 2, 3])
# IO.inspect MyList.sum_tr([1, 2, 3])

# IO.inspect MyList.reduce([1, 4, 2, 3], -1, &max/2)
# IO.inspect MyList.reduce([], &max/2)
# IO.inspect MyList.reduce([1, 4, 2, 3], fn item, max -> max(item, max) end)
# IO.inspect MyList.reduce([1, 4, 2, 3], fn item, max -> item + max end)

# IO.inspect MyList.my_max([1])
# IO.inspect MyList.my_max([1, 4, 2, 3])

# IO.inspect MyList.my_max_tr([1])
# IO.inspect MyList.my_max_tr([1, 4, 2, 3])

# IO.inspect MyList.caesar('ryvkve', 13)

# IO.inspect MyList.swap([1,2,3])
# IO.inspect MyList.swap([1,2,3,4])


IO.inspect MyList.span(1, 4)
IO.inspect MyList.span(4, 4)
IO.inspect MyList.span(4, 1)
