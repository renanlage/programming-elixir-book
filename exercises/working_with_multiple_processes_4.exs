defmodule Monitor4 do
  import :timer, only: [sleep: 1]

  def notify_parent(pid) do
    send pid, "Hi"
    raise "Boom!!!"
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
    spawn_link(Monitor4, :notify_parent, [self()])
    sleep 500
    receive_messages()
  end
end

Monitor4.run()
