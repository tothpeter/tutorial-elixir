defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end

# IO.inspect Factorial.of(4)


defmodule MyEnum do
  import Kernel, except: [length: 1]

  def length([_head | tail]), do: 1 + length(tail)
  def length([]), do: 0

  def length2(list), do: do_length2(list, 0)
  defp do_length2([_head | tail], l), do: do_length2(tail, l + 1)
  defp do_length2([], l), do: l
end

# IO.inspect MyEnum.length([1,2,3])
# IO.inspect MyEnum.length2([1,2,3])


defmodule MyMath do
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

# IO.inspect MyMath.gcd(15, 9)


(1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40))
# |> IO.inspect

defmodule MyModule do
  @module_related_attr "Peter"

  def get_module_related_attr do
    @module_related_attr
  end
end

IO.inspect MyModule.get_module_related_attr
