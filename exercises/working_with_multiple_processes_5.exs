defmodule Monitor5 do
  import :timer, only: [sleep: 1]

  def notify_parent_and_raise(pid) do
    send pid, "Hi"
    raise "Boom!!!"
  end

  def notify_parent_and_exit(pid) do
    send pid, "Hi"
    exit :boom
  end

  def receive_messages do
    receive do
      msg -> IO.inspect msg
      receive_messages()
    after 0 ->
      IO.puts "No more messages to process"
    end
  end

  def run_raise do
    spawn_monitor(Monitor5, :notify_parent_and_raise, [self()])
    sleep 500
    receive_messages()
  end

  def run_exit do
    spawn_monitor(Monitor5, :notify_parent_and_exit, [self()])
    sleep 500
    receive_messages()
  end
end

Monitor5.run_exit()
Monitor5.run_raise()
