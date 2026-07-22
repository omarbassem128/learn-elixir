defmodule PotionChat do

  def listen(users_PIDs_list) do
    receive do
      {:connect_user, user_PID} ->
        updated_PIDs_list = user_PID ++ users_PIDs_list
        listen(updated_PIDs_list)
      {:new_msg, msg} ->
        send_msg(msg, users_PIDs_list, length(users_PIDs_list))
        listen(users_PIDs_list)
    end
  end

  def send_msg(msg, users_PIDs_list, n) when n > 0 do
    #push message
    send_msg(msg, users_PIDs_list, n - 1)
  end

end
