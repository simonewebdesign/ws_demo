ExUnit.start

Mix.Task.run "ecto.create", ~w(-r WsDemo.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r WsDemo.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(WsDemo.Repo)

