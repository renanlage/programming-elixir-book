defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} -> send(sender, {:ok, "Hello, #{msg}"})
    end
  end
end

pid = spawn(Spawn1, :greet, [])
send(pid, {self(), "World!"})

receive do
  {:ok, msg} -> IO.puts msg
end
