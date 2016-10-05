defmodule WsDemo.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    {:ok, "welcome", socket}
  end

  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", _payload, socket) do
    {:reply, {:ok, %{}}, socket}
  end

  def handle_in("sum", payload, socket) when is_list(payload) do
    result = Enum.reduce payload, 0, &+/2
    {:reply, {:ok, result}, socket}
  end

  def handle_in("double", payload, socket) when is_list(payload) do
    result = Enum.map payload, fn(x) -> x * 2 end
    {:reply, {:ok, result}, socket}
  end
end
