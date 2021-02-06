defmodule Chatourius.Repo do
  use Ecto.Repo,
    otp_app: :chatourius,
    adapter: Ecto.Adapters.Postgres
end
