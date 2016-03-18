handle_open = fn
	{:ok, file} -> "Read data: #{IO.read(file, :line)}"
	{_, error}  -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("/Users/joff/.bashrc"))

IO.puts handle_open.(File.open("/nope"))

IO.puts "--------------------"
greeter = fn name -> (fn -> "Hello #{name}" end) end
dave_greeter = greeter.("Dave")
IO.puts dave_greeter.()

IO.puts "--------------------"

add_n = fn n -> (fn other -> n + other end) end
add_two = add_n.(2)
add_five = add_n.(5)
IO.puts add_two.(3)
IO.puts add_five.(7)
IO.puts "--------------------"

prefix = fn prefix -> (fn str -> "#{prefix} #{str}" end) end
mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Pattern Matching").("Is Amazing")
