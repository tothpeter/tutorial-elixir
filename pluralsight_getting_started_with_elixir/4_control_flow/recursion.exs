defmodule Sample.Enum do
  import Kernel, except: [length: 1]

  def map([head | tail], fun), do: [fun.(head) | map(tail, fun)]
  def map([], _fun), do: []

  def sing(), do: sing(4)

  def sing(i) when i > 1 do
    IO.puts("#{i} bottles")
    sing(i-1)
  end

  def sing(1) do
    IO.puts "1 more bottle"
    sing(0)
  end

  def sing(0), do: IO.puts "no more bottle";


  def length([_ | tail]), do: 1 + length(tail)
  def length([]), do: 0

  def length_tail_recursive([]), do: 0
  def length_tail_recursive(list), do: length_tail_recursive(list, 1)
  def length_tail_recursive([_ | tail], len), do: length_tail_recursive(tail, len + 1)
  def length_tail_recursive([], len), do: len

  def reverse(list), do: reverse(list, [])
  def reverse([head | tail], reversed), do: reverse(tail, [head | reversed])
  def reverse([], reversed), do: reversed
end

# IO.inspect Sample.Enum.map([1,2,3], &(&1 * 2))
# Sample.Enum.sing
# IO.inspect Sample.Enum.length([1,3,4])
IO.inspect Sample.Enum.length_tail_recursive([1,3,4])
IO.inspect Sample.Enum.length_tail_recursive([])

IO.inspect Sample.Enum.reverse([1,2,3])
