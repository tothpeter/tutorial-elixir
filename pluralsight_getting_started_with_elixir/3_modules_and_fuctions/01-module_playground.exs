# iex "module_playground.exs"
# r(ModulePlayground)
# import IEx.Helpers
# import_file("misc_util_math.exs")

defmodule ModulePlayground do
  import IO, only: [ puts: 1 ]
  import Kernel, except: [ inspect: 1 ]

  alias ModulePlayground.Misc.Util.Math, as: MyMath

  require Integer

  def say_here do
    inspect "Here"
  end

  def inspect(param1) do
    puts "-------"
    puts param1
    puts "-------"
  end

  def print_sum do
    MyMath.add(1, 2)
  end

  def print_is_even(num) do
    puts "Is #{num} even? #{Integer.is_even(num)}"
  end
end

defmodule ModulePlayground.Misc.Util.Math do
  def add(a, b) do
    a + b
  end
end



# ModulePlayground.say_here
# IO.puts ModulePlayground.print_sum()
ModulePlayground.print_is_even(2)
