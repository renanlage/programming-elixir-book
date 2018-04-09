defmodule Parallel do
  def buggy_pmap(collection, func) do
    me = self()
    collection
    |> Enum.map(fn el ->
      spawn_link fn ->
        :timer.sleep(:rand.uniform(10) * 200)
        send me, {self(), func.(el)}
      end
    end)
    |> Enum.map(fn _pid ->
      receive do
        {_pid, result} -> result
      end
    end)
  end

  def pmap(collection, func) do
    me = self()
    collection
    |> Enum.map(fn el ->
      spawn_link fn ->
        send me, {self(), func.(el)}
      end
    end)
    |> Enum.map(fn pid ->
      receive do
        {^pid, result} -> result
      end
    end)
  end
end

IO.inspect Parallel.pmap([1,2,3,4,5,6,7,8,9], fn x -> x * 2 end)
IO.inspect Parallel.buggy_pmap([1,2,3,4,5,6,7,8,9], fn x -> x * 2 end)
