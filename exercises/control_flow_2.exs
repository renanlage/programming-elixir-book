defmodule ControlFlow.MustBe do
  def ok!(func_output) do
    case (func_output) do
      {:ok, data} -> data
      {error, message} -> raise "#{error}: #{message}"
    end
  end
end

IO.puts(
  File.open("exercises/control_flow_1.exs")
  |> ControlFlow.MustBe.ok!
  |> IO.stream(9)
  |> Enum.take(1) == ["defmodule"]
)

try do
  ControlFlow.MustBe.ok! File.open "not_exist"
rescue e ->
  IO.puts e.message == "error: enoent"
end
