["hi", "there", "hello", "hello", "hi", "hi"]
|> Enum.reduce( Map.new, fn(word, map) -> 
	Map.update(map, word, 1, &(&1 +1))	end)
|> Enum.sort_by(fn{k,v} -> v end)
|> Enum.reverse
|> Enum.each(fn(x) -> {k,v} = x; IO.puts "#{k}\t#{v}" end )
