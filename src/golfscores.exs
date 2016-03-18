bob = [1,4,2,1,3,4,4]
par = [2,3,3,3,1,3,2]

winnings = bob 
  |> Enum.zip(par)
  |> Enum.map( fn {score,par} -> score - par end )
  |> Enum.filter( fn delta -> delta > 0 end )
  |> Enum.sum

IO.puts "Winnings: $#{winnings}"
