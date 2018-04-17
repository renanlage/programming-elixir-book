defmodule Sequence do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    initial_number = Application.get_env(:sequence, :initial_number)
    {:ok, _pid} = Sequence.Supervisor.start_link(initial_number)
  end
end
