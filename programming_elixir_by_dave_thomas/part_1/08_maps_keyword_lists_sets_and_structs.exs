defmodule Canvas do
  @defaults [ fg: "black", bg: "white", font: "Merriweather" ]

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts text
    IO.inspect options
  end
end

# Canvas.draw_text "Toma", margin: 5

person = %{ name: "Dave", height: 1.88 }

# %{ name: dave } = person
# IO.inspect dave
%{ name: _, height: _ } = person

# people = [
#   %{ name: "Grumpy",    height: 1.24 },
#   %{ name: "Dave",      height: 1.88 },
#   %{ name: "Dopey",     height: 1.32 },
#   %{ name: "Shaquille", height: 2.16 },
#   %{ name: "Sneezy",    height: 1.28 }
# ]

# IO.inspect Enum.filter(people, fn person -> person[:height] > 1.5 end)
# IO.inspect for person = %{ height: height } <- people, height > 1.5, do: person
# IO.inspect for person <- people, person[:height] > 1.5, do: person


# data = %{ name: "Dave", state: "TX", likes: "Elixir" }
#
# for key <- [:name, :state] do
#   %{ ^key => value } = data
#   value
# end
# |> IO.inspect

# old_hash = %{ a: 1, b: 2, c: 3 }
# new_hash = %{ old_hash | b: -1, c: -2 }
# new_hash = Map.put_new(new_hash, :aa, 11)
# IO.inspect new_hash

# Structs


defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true

  def may_attend_to_party(attendee) do
    attendee.paid && attendee.over_18
  end
end

defmodule Main do
  def run do
    s1 = %Subscriber{ paid: true }
    IO.inspect s1

    %Subscriber{ paid: pp } = %Subscriber{ paid: true }
    IO.inspect pp

    IO.inspect Subscriber.may_attend_to_party s1
  end
end

# Main.run

set1 = MapSet.new [ 1, 2, 3 ]
set2 = MapSet.new [ 3 ,4 ,5 ]
IO.inspect MapSet.union(set1, set2)
IO.inspect MapSet.intersection(set1, set2)
