defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end


{ :ok, pid } = GenServer.start_link(Stack.Server, [5, "cat", 9])
IO.puts GenServer.call(pid, :pop) == 5
IO.puts GenServer.call(pid, :pop) == "cat"
IO.puts GenServer.call(pid, :pop) == 9
