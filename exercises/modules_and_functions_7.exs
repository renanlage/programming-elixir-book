# Convert float to string with two decimal digits (Erlang)
:io.format("~.2f", [15.894])
:io_lib.format("~.2f", [15.894])
:erlang.float_to_list(15.894,[{:decimals, 2}])

# Get the value of an operating system environ variable (Elixir)
System.get_env("PWD")

# Return the extension component of a fila name (Elixir)
Path.extname('/dave/test.iex')

# Return the process' current working directory (Elixir)
System.cwd()

# Convert a string containing JSON into Elixir data structures
# https://github.com/devinus/poison
# Poison.Parser.parse!(~s({"name": "Devin Torres", "age": 27}), keys: :atoms!)

# Execute a command in your operating system’s shell
System.cmd("echo", ["Hello"])
