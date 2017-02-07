defmodule Sample.Enum do
  def first([]), do: nil
  def first([head | _]), do: head

  def first2(list) when length(list) == 0, do: nil
  def first2([head | _]), do: head

  def last([head | []]), do: head
  def last([_ | tail]), do: last(tail)
end

defmodule Sample.Calendar do
  def is_leep_year?(year) when rem(year, 400) == 0, do: true
  def is_leep_year?(year) when rem(year, 100) == 0, do: false
  def is_leep_year?(year) when rem(year, 4) == 0, do: true
  def is_leep_year?(_year), do: false

  def is_leep_year?, do: is_leep_year?(Date.utc_today.year)
end


# IO.inspect Sample.Enum.first([])
# IO.inspect Sample.Enum.first([1,2,3])
# IO.inspect Sample.Enum.last([1,2,3])

# IO.inspect Sample.Enum.first2([1,2,3])
IO.inspect Sample.Calendar.is_leep_year?(2016)
IO.inspect Sample.Calendar.is_leep_year?
