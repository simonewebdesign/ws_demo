# WsDemo

Reproducing this error:

```
[error] GenServer #PID<0.1276.0> terminating
** (RuntimeError) Channel replies from `handle_in/3` are expected to be one of:

    status :: atom
    {status :: atom, response :: map}

for example:

    {:reply, :ok, socket}
    {:reply, {:ok, %{}}, socket}
    {:stop, :shutdown, {:error, %{}}, socket}

got {:ok, "foo"}

    (phoenix) lib/phoenix/channel/server.ex:311: Phoenix.Channel.Server.handle_reply/3
    (phoenix) lib/phoenix/channel/server.ex:254: Phoenix.Channel.Server.handle_result/2
    (stdlib) gen_server.erl:615: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:681: :gen_server.handle_msg/5
    (stdlib) proc_lib.erl:240: :proc_lib.init_p_do_apply/3
Last message: %Phoenix.Socket.Message{event: "new_msg", payload: "Some string", ref: "21", topic: "rooms:lobby"}
State: %Phoenix.Socket{assigns: %{}, channel: WsDemo.RoomChannel, channel_pid: #PID<0.1276.0>, endpoint: WsDemo.Endpoint, handler: WsDemo.UserSocket, id: nil, joined: true, pubsub_server: WsDemo.PubSub, ref: nil, serializer: Phoenix.Transports.WebSocketSerializer, topic: "rooms:lobby", transport: Phoenix.Transports.WebSocket, transport_name: :websocket, transport_pid: #PID<0.1258.0>}
```

The issue is here: https://github.com/simonewebdesign/ws_demo/blob/master/web/channels/room_channel.ex#L12-L14

---

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
