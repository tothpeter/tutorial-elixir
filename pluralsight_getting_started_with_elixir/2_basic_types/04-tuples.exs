book_tuple = { "Book title", "Author", 25.00 }

IO.inspect book_tuple
IO.inspect elem(book_tuple, 1)
IO.inspect put_elem(book_tuple, 1, "Dave Thomas")
IO.inspect book_tuple

{title, _, _} = book_tuple

IO.inspect title
