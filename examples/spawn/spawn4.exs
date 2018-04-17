defmodule Spawn4 do
  def greet do
    receive do
      {sender, msg} -> send sender, {:ok, "Hello, #{msg}"}
      greet()
    end
  end
end

pid = spawn(Spawn4, :greet, [])
self_pid = self()

send pid, {self_pid, "World!"}
receive do
  {:ok, msg} -> IO.puts(msg)
end

send pid, {self_pid, "Kermit!"}
receive do
  {:ok, msg} -> IO.puts(msg)
after 500 -> IO.puts("The greeter has gone away")
end
