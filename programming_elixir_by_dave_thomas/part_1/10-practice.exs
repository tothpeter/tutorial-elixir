# all?, each, filter, split, take
defmodule MyEnum do
  def all?(list), do: all?(list, &(!!&1))

  def all?([ head | tail ], fun) do
    if fun.(head) do
      all?(tail, fun)
    else
      false
    end
  end

  def all?([], _fun), do: true


  def each([ head | tail ], fun) do
    fun.(head)
    each(tail, fun)
  end

  def each([], _fun), do: :ok


  def filter([ head | tail ], fun) do
    if fun.(head) do
      [ head | filter(tail, fun) ]
    else
      filter(tail, fun)
    end
  end

  def filter([], _fun), do: []


  def split(list, count), do: split(list, count, [])
  def split([], _count, front),  do: [front, []]
  def split(list, 0, front), do: [ Enum.reverse(front), list ]
  def split([ head | tail ], count, front), do: split(tail, count - 1, [ head | front ])


  def split_while(list, fun), do: split_while(list, fun, [])

  def split_while([ head | tail ], fun, front) do
    if fun.(head) do
      split_while(tail, fun, [ head | front ])
    else
      [ Enum.reverse(front), [ head | tail ] ]
    end
  end

  def split_while([], _fun, front), do: [front, []]

  def take(list, n), do: hd(split(list, n))

  # Flatten 1
  def flatten1([ head | tail ]), do: flatten1(head) ++ flatten1(tail)
  def flatten1([]), do: []
  def flatten1(item), do: [ item ]

  # Flatten 2
  def flatten2(list), do: do_flatten_flatten2(list, [])

  # Final case
  def do_flatten_flatten2([], result), do: Enum.reverse(result)

  # when the head is a list itself
  def do_flatten_flatten2([ [h | []] | tail ], result) do
    do_flatten_flatten2([ h | tail ], result )
  end

  def do_flatten_flatten2([ [h | t] | tail ], result) do
    do_flatten_flatten2([ h, t | tail ], result )
  end

  # Base cases
  def do_flatten_flatten2([ [] | tail ], result) do
    do_flatten_flatten2(tail, result)
  end

  def do_flatten_flatten2([ head | tail ], result) do
    do_flatten_flatten2(tail, [ head | result ])
  end


  # Flatten 3
  def flatten(list), do: do_flatten(list, [])

  def do_flatten([ h | t ], tail) when is_list(h) do
    do_flatten(h, do_flatten(t, tail))
  end

  def do_flatten([ h | t ], tail) do
    [h | do_flatten(t, tail)]
  end

  def do_flatten([], tail) do
    tail
  end
end

# IO.inspect MyEnum.all?([true, true])
# IO.inspect MyEnum.all?([1,2,3,4], &(&1 < 3))

# IO.inspect MyEnum.each([1,2,3,4], &IO.puts/1)
# IO.inspect MyEnum.filter([1,2,3,4], &(&1 < 3))
# IO.inspect MyEnum.split([1,2,3,4], &(&1 < 3))
# IO.inspect MyEnum.split([1,2,3,4], &(&1 > 9))



# IO.inspect MyEnum.split([1,2,3,4], 2)
# IO.inspect MyEnum.split([1,2,3,4], 0)
# IO.inspect MyEnum.split([1,2,3,4], 9)

# IO.inspect MyEnum.split_while([1,2,3,4], &(&1 < 3))
# IO.inspect MyEnum.split_while([1,2,3,4], &(&1 > 9))

# IO.inspect MyEnum.take([1,2,3,4], 2)

IO.inspect MyEnum.flatten([1, [2]])
IO.inspect MyEnum.flatten([1, [2, []]])
IO.inspect MyEnum.flatten([1, [[], 2]])
IO.inspect MyEnum.flatten([1, [], [2, []], []])
IO.inspect MyEnum.flatten([1, [2, []], []])
IO.inspect MyEnum.flatten([[], 1, [2, [3], [[]]], 4, []])
