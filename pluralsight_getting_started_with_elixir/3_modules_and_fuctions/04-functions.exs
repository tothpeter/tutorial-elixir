defmodule Sample.Enum do
  def first([]), do: nil
  def first([head | _]), do: head

  def last([head | []]), do: head
  def last([_ | tail]), do: last(tail)
end


IO.inspect Sample.Enum.first([])
IO.inspect Sample.Enum.first([1,2,3])
IO.inspect Sample.Enum.last([1,2,3])
