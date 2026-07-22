defmodule PotionChatTest do
  use ExUnit.Case
  doctest PotionChat

  test "greets the world" do
    assert PotionChat.hello() == :world
  end
end
