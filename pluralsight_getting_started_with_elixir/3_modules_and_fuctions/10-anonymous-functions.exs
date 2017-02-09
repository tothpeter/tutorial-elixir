list = [1,2,3]

IO.inspect Enum.map(list, fn x -> x * x end)
IO.inspect Enum.reduce(list, 10, fn x, acc -> acc + x end)

IO.inspect Enum.map(list, &(&1 * &1))
IO.inspect Enum.reduce(list, 10, &(&1 + &2))

defmodule MyList do
  def map([head | []], fun), do: [fun.(head)]
  def map([head | tail], fun), do: [fun.(head) | map(tail, fun)]


  def map2([head | tail], fun), do: map2(tail, fun, [fun.(head)])
  
  def map2([head | tail], fun, ret), do: map2(tail, fun, [fun.(head) | ret])
  def map2([], _, ret), do: Enum.reverse(ret)
end

IO.inspect MyList.map([1,2,3], &(&1 * &1))
IO.inspect MyList.map2([1,2,3], &(&1 * &1))
