content = "Now is the time"

lp  =  with {:ok, file}   =  File.open("/etc/passwd"),
            content       =  IO.read(file, :all),
            :ok           =  File.close(file),
            [_, uid, gid] <- Regex.run(~r/_lp:.*?:(\d+):(\d+)/, content)
       do
            "Group: #{gid}, User: #{uid}"
       end

IO.puts lp
IO.puts content


values = [1,2,4]
mean = with count = Enum.count(values),
            sum = Enum.sum(values)
      do
        sum / count
      end

IO.puts mean
