defmodule MetroSucks do

	@alamein 	%{ name: 'Alemein', 	  stations: ['Flinders Street','Richmond','East Richmond','Burnley','Hawthorn','Glenferrie'] }
	@sandringham 	%{ name: 'Sandringham',   stations: ['Southern Cross','Richmond','South Yarra','Prahran','Windsor'] }
	@glen_waverley 	%{ name: 'Glen Waverley', stations: ['Flagstaff','Melbourne Central','Parliament','Richmond','Kooyong','Tooronga'] }
	
	@all_lines 		[@alamein, @sandringham, @glen_waverley]
	@interchange    'Richmond'

	def commute origin, destination do
		if different_line origin, destination do
			Enum.concat( map_journey(origin, 	   @interchange), 
	 					 map_journey(@interchange, destination) )
		else
			map_journey origin, destination
		end
		|> Enum.uniq
		|> Enum.join( " --> " )
		|> IO.puts
	end

	defp different_line( @interchange, _), do: false
	defp different_line( _, @interchange), do: false
	defp different_line origin, destination do
		what_line(origin) != what_line(destination)
	end

	defp what_line (@interchange), do: :dunno
	defp what_line station do
		Enum.find(@all_lines, fn line -> Enum.any?(line.stations, fn s -> s === station end )  end)
	end

	defp map_journey origin, destination do
		_ = origin
		_ = destination
		['Windsor', 'Prahran', 'South Yarra']
	end

end

MetroSucks.commute 'Glenferrie', 'Southern Cross' 

