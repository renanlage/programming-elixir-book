defmodule Chain do
  def send_back(pid) do
    receive do
      token -> send pid, token
    end
    send_back(pid)
  end

  def create_processes do
    self_pid = self()
    pid_1 = spawn Chain, :send_back, [self_pid]
    pid_2 = spawn Chain, :send_back, [self_pid]

    send pid_1, "betty"
    send pid_2, "fred"

    receive_back()
  end

  def receive_back do
    receive do
      "fred" = token -> IO.puts token
    end

    receive do
      "betty" = token -> IO.puts token
    end
  end
end
