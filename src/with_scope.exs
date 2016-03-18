# content = "Now is the time"
# lp = with {:ok, file} = File.open("/etc/passwd"),
#   content = IO.read(file, :all),
#   :ok = File.close(file),
#   [_, uid, gid] <- Regex.run(~r/_lp:.*?:(\d+):(\d+)/, content)
# do
#   "Group: #{gid}, User: #{uid}"
# end

# IO.puts lp #=> Group: 26, User: 26
# IO.puts content # the 'with' expression creates a scope


values = [0, 1, 1, 2, 3, 5, 8]

mean = with( 
            count = Enum.count(values),
            sum   = Enum.sum(values) 
          )
        do
          sum/count
        end

IO.puts mean

IO.puts with count = Enum.count(values),
  sum = Enum.sum(values),
  do: sum/count
