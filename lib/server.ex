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

end
