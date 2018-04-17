defmodule Stack.Server do
  use GenServer

  # External API

  def start_link(stash_pid) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(el) do
    GenServer.cast(__MODULE__, {:push, el})
  end

  # GenServer implementation

  def init(stash_pid) do
    current_list = Stack.Stash.get_value stash_pid
    {:ok, {current_list, stash_pid}}
  end

  def terminate(_reason, {current_list, stash_pid}) do
    Stack.Stash.save_value stash_pid, current_list
  end

  def handle_call(:pop, _from, {[head | tail], stash_pid}) do
    {:reply, head, {tail, stash_pid}}
  end

  def handle_cast({:push, el}, {stack, stash_pid}) do
    {:noreply, {[el | stack], stash_pid}}
  end
end
