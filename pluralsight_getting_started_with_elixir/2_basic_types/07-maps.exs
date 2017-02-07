my_map = %{
  :names => ["Peter", "Toma"],
  "gender" => :male
}

IO.inspect my_map[:names]
IO.inspect my_map.names


my_map2 = %{
  {:ok, 1} => true,
  {:error, 0} => false
}

IO.inspect my_map2[{:ok, 1}]


%{{:ok, 1} => result} = my_map2
%{:names => name_list} = my_map
IO.inspect name_list
