defmodule PotionChat.Server do
  use GenServer

  @impl true
  def init([]) do
    {:ok, []}
  end

  @impl true
  def handle_cast({:connect_user, new_user_pid}, state) do
    new_state = [new_user_pid | state]
    {:noreply, new_state}
  end

  @impl true
  def handle_cast({:new_msg, sender_pid, msg}, state) do
    Enum.each(state, fn (user_pid) -> send(user_pid, "#{inspect(sender_pid)}: #{msg}") end)
    {:noreply, state}
  end

  def connect(server_pid) do
    GenServer.cast(server_pid, {:connect_user, self()})
  end
end
