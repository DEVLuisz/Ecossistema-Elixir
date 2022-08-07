use Mix.Config

config :elixir_teste, ElixirTeste.Scheduler, jobs: [
  {"* * * * *", fn -> GenServer.cast(:server_random, :escreve) end}
]