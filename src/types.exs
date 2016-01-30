content = "Now is the time"
lp = with {:ok, file} = File.open("/etc/passwd"),
  content = IO.read(file, :all),
  :ok = File.close(file),
  [_, uid, gid] = Regex.run(~r/_lp:.*?:(\d+):(\d+)/, content)
do
  "Group: #{gid}, User: #{uid}"
end

IO.puts lp #=> Group: 26, User: 26
IO.puts content # the 'with' expression creates a scope
