sum = fn a, b -> a + b end
IO.inspect sum.(1, 2)

const = fn -> 99 end
IO.inspect const.()

swap = fn {a, b} -> {b, a} end
IO.inspect swap.({1, 2})

list_concat = fn list1, list2 -> list1 ++ list2 end
IO.inspect list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]

pair_tuple_to_list = fn {a, b} -> [a, b] end
IO.inspect pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]

# One Function, Multiple Bodies
my_div = fn
  _, 0 -> nil
  a, a -> 1
  a, b -> a / b
end

IO.inspect my_div.(2, 0)
IO.inspect my_div.(2, 2)


handle_open = fn
  { :ok, file } -> IO.read(file, :line)
  { _, error }  -> "Error: #{:file.format_error(error)}"
end

File.open("README.md")
|> handle_open.()
|> IO.inspect

# Exercise
fizz_word = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

fizz_buzz = fn
  number -> IO.puts(fizz_word.(rem(number, 3), rem(number, 5), number))
end

(1..20)
|> Enum.each(fizz_buzz)

# Functions Can Return Functions

greeter = fn name -> (fn -> "Hi #{name}" end) end
peter_greeter = greeter.("Peter")
IO.puts peter_greeter.()
