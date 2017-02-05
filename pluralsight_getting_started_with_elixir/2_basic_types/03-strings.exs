euro = "€"
IO.inspect byte_size(euro)
IO.inspect byte_size("$")

IO.inspect "Hello, " <> "Peter"

interpolation = "content"

IO.inspect "String interpolation: #{interpolation}"

IO.inspect "Text #{[ 1, 2, 3 ]}"
IO.inspect "Text" <> <<0>>
