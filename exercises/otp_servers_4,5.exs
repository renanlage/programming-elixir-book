defmodule Stack.Server do
  use GenServer

  def start_link(list) do
    GenServer.start_link(__MODULE__, list, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(el) do
    GenServer.cast(__MODULE__, {:push, el})
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, el}, stack) do
    {:noreply, [el | stack]}
  end

  def terminate(reason, state) do
    IO.puts "Im terminating biatchesss\n#{inspect reason}\n#{inspect state}"
  end
end


Stack.Server.start_link([5, "cat", 9])
IO.puts Stack.Server.pop() == 5
IO.puts Stack.Server.pop() == "cat"

Stack.Server.push("dog")
IO.puts Stack.Server.pop() == "dog"
IO.puts Stack.Server.pop() == 9
