defmodule Sequence.Server do
  use GenServer

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end

  def format_status(_reason, [_pdit, state]) do
    [data: [{'State', "My Current state is '#{inspect state}', and I'm Happy"}]]
  end
end
