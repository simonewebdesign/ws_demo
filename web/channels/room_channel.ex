defmodule WsDemo.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    {:ok, "welcome", socket}
  end

  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", _payload, socket) do
    {:reply, {:ok, "foo"}, socket}
  end
end
