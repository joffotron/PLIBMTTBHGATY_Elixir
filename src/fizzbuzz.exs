fizzbuzz = fn
	0, 0, _ -> "FizzBuzz"
	0, _, _ -> "Fizz"
	_, 0, _ -> "Buzz"
	_, _, c -> c
end

buzzy = fn n -> fizzbuzz.(rem(n,3), rem(n,5), n) end

Enum.each 10..16, fn i -> IO.puts buzzy.(i) end
