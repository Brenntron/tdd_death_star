use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tdd_death_star, TddDeathStar.Endpoint,
  http: [port: 4001],
  server: true

config :hound, driver: "selenium"

# Print only warnings and errors during test
config :logger, level: :warn

# Set a higher stacktrace during test
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :tdd_death_star, TddDeathStar.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tdd_death_star_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
