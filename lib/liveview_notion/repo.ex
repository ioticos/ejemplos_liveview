defmodule LiveviewNotion.Repo do
  use Ecto.Repo,
    otp_app: :liveview_notion,
    adapter: Ecto.Adapters.Postgres
end
