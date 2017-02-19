# [1,2,3,4]
# |> Stream.map(&(&1*&1))
# |> Stream.map(&(&1+1))
# |> Stream.filter(fn x -> rem(x,2) == 1 end)
# |> Enum.to_list
# |> IO.inspect


# File.open!("part_1/test_file")
# |> IO.stream(:line)
# |> Enum.max_by(&String.length/1)
# |> IO.inspect

# File.stream!("part_1/test_file")
# |> Enum.max_by(&String.length/1)
# |> IO.inspect


# Stream.cycle(~w{ green white })
# Stream.cycle(["green", "red"])
# |> Stream.zip(1..5)
# |> Enum.map(fn {class, value} -> "#{class} <span>#{value}</span>" end)
# |> IO.inspect

# Stream.repeatedly(fn -> true end)
# |> Enum.take(3)
# |> IO.inspect

Stream.iterate(0, &(&1 + 1))
|> Enum.take(5)
|> IO.inspect
