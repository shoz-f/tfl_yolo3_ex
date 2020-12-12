defmodule TflYolo3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: TflYolo3.Router, options: [port: 5000]},
      {TflYolo3.TflInterp, [model: "priv/yolov3-416-dr.tflite", opts: "-n"]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TflYolo3.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
