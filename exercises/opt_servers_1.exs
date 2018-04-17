defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, el}, stack) do
    {:noreply, [el | stack]}
  end
end


{ :ok, pid } = GenServer.start_link(Stack.Server, [5, "cat", 9])
IO.puts GenServer.call(pid, :pop) == 5
IO.puts GenServer.call(pid, :pop) == "cat"

GenServer.cast(pid, {:push, "dog"})
IO.puts GenServer.call(pid, :pop) == "dog"
IO.puts GenServer.call(pid, :pop) == 9
