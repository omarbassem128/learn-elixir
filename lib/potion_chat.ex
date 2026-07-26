defmodule PotionChat do

  def listen(users_PIDs_list) do
    receive do
      {:connect_user, user_PID} ->
        updated_PIDs_list = [user_PID | users_PIDs_list]
        listen(updated_PIDs_list)

      {:new_msg, sender_PID, msg} ->
        Enum.each(users_PIDs_list, fn (user_PID) -> send(user_PID, "#{inspect(sender_PID)}: #{msg}") end)
        listen(users_PIDs_list)
    end
  end
end
