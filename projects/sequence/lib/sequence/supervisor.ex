defmodule Sequence.Supervisor do
  use Supervisor

  def start_link(initial_number, initial_delta) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [])
    initial_state = {initial_number, initial_delta}
    start_workers(sup, initial_state)
    result
  end

  def start_workers(sup, initial_state) do
    {:ok, stash_pid} =
      Supervisor.start_child(sup, worker(Sequence.Stash, [initial_state]))

    Supervisor.start_child(sup, supervisor(Sequence.SubSupervisor, [stash_pid]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
