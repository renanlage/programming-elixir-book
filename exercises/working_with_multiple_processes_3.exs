defmodule Monitor3 do
  import :timer, only: [sleep: 1]

  def notify_parent(pid) do
    send pid, "Hi"
    exit(:boom)
  end

  def receive_messages do
    receive do
      msg -> IO.inspect msg
      receive_messages()
    after 0 ->
      IO.puts "No more messages to process"
    end
  end

  def run do
    spawn_link(Monitor3, :notify_parent, [self()])
    sleep 500
    receive_messages()
  end
end

Monitor3.run()
