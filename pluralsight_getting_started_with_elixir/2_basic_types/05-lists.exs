# List

# my_list = [ :ok, 1, "Test" ]
#
# IO.inspect hd(my_list)
# IO.inspect tl(my_list)
# IO.inspect [1 | [2, 3]]
# IO.inspect [1 | [2 | [3 | []]]]
#
# # Very fast, just set 2 pointers
# IO.inspect [:not | my_list]
#
# [a, b, _] = my_list
#
# IO.inspect a
#
# [head | tail] = my_list
#
# IO.inspect head
# IO.inspect tail
#
# # Keyword List
#
# options = [{:is_active, false}, {:notify, true}]
#
# IO.inspect options[:is_active]
# IO.inspect options == [is_active: false, notify: true]


languages1 = ["ruby", "js"]
languages2 = List.insert_at(languages1, 0, "C++")

IO.inspect languages1
IO.inspect languages2
