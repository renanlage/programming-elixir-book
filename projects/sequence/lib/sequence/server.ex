defmodule Sequence.Server do
  use GenServer
  require Logger

  @vsn "1"
  defmodule State do
    defstruct current_number: 0, stash_pid: nil, delta: 1
  end

  # External API

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def next_number do
    with number = GenServer.call(__MODULE__, :next_number),
    do: "The next number is #{number}"
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  # GenServer implementation

  def init(stash_pid) do
    current_number = Sequence.Stash.get_value stash_pid
    {:ok, %State{current_number: current_number, stash_pid: stash_pid}}
  end

  def handle_call(:next_number, _from, state) do
    {:reply,
    state.current_number,
    %State{state | current_number: state.current_number + state.delta}}
  end

  def handle_cast({:increment_number, delta}, state) do
    {:noreply,
    %State{state | current_number: state.current_number + delta, delta: delta}}
  end

  def terminate(_reason, state) do
    Sequence.Stash.save_value state.stash_pid, state.current_number
  end

  def code_change("0", old_state = { current_number, stash_pid }, _extra) do
    new_state = %State{
      current_number: current_number,
      stash_pid: stash_pid,
      delta: 1
    }
    Logger.info "Changing code from 0 to 1"
    Logger.info inspect(old_state)
    Logger.info inspect(new_state)
    {:ok, new_state}
  end

  def format_status(_reason, [_pdit, state]) do
    [data: [{'State', "My Current state is '#{inspect state}', and I'm Happy"}]]
  end
end
