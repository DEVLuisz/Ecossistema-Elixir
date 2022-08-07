defmodule ElixirTeste.Applicacao do
  use Application

  def start(_type, _args) do
    children = [
      ElixirTeste.Server,
      ElixirTeste.Scheduler
    ]

    opts = [
      strategy: :one_for_one,
      name: ElixirTeste.Supervisor
    ]
    Supervisor.start_link(children, opts)
  end
end