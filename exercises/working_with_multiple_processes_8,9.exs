defmodule FibSolver do
  def fib(scheduler) do
    send scheduler, { :ready, self() }
    receive do
      { :fib, n, client } ->
        result =  fib_calc(n)
        send client, { :answer, n, result }
        fib(scheduler)

      { :shutdown } ->
        exit(:normal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
end

defmodule CatCounter do
  def count(scheduler) do
    send scheduler, { :ready, self() }
    receive do
      { :count, filepath, client } ->
        result = count_cats(filepath)
        send client, { :answer, filepath, result }
        count(scheduler)

      { :shutdown } ->
        exit(:normal)
    end
  end

  defp count_cats(filepath) do
    File.read!(filepath)
    |> String.split
    |> Enum.count(&(&1 == "cat"))
  end
end


defmodule Scheduler do
  def run(num_processes, module, func, to_calculate) do
    (1..num_processes)
    |> Enum.map(fn _ -> spawn module, func, [self()] end)
    |> schedule_processes(func, to_calculate, [])
  end

  defp schedule_processes(processes, func, queue, results) do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [next | tail] = queue
        send pid, {func, next, self()}
        schedule_processes(processes, func, tail, results)

      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), func, queue, results)
        else
          Enum.sort results, fn {param1, _}, {param2, _} -> param1 <= param2 end
          Enum.sort results, fn {param1, _}, {param2, _} -> param1 <= param2 end
        end

      {:answer, param, result} ->
        schedule_processes(processes, func, queue, [{param, result} | results])
    end
  end
end

defmodule Runner do
  def run(module, func, to_process) do
    Enum.each 1..10, fn num_processes ->
      {time, result} = :timer.tc(
        Scheduler, :run, [num_processes, module, func, to_process]
      )

      if num_processes == 1 do
        IO.puts inspect result
        IO.puts "\n #  time (s)"
      end
      :io.format "~2B   ~.2f~n", [num_processes, time/1000000.0]
    end
  end

  def run_fib do
    to_process = List.duplicate(37, 20)
    run(FibSolver, :fib, to_process)
  end

  def run_cat_count(dir) do
    files = File.ls!(dir)
    |> Enum.map(&Path.join(dir, &1))
    |> Enum.filter(&(!File.dir?(&1)))
    run(CatCounter, :count, files)
  end
end

Runner.run_cat_count('exercises/')
