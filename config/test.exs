import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :basic_phx_app, BasicPhxApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "basic_phx_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :basic_phx_app, BasicPhxAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "CX3CtQbu7Sa9wbX9ycA4TN8oF7GvGKSXPRxEFE6Z4L47GDGxMwBWXM62iZY5a5eW",
  server: false

# In test we don't send emails.
config :basic_phx_app, BasicPhxApp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
