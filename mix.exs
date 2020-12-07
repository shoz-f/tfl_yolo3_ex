defmodule TflYolo3.MixProject do
  use Mix.Project

  def project do
    [
      app: :tfl_yolo3,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      make_executable: "make",  #InvokeMinGW64make
      make_clean: ["clean"],
      compilers: [:elixir_make]++Mix.compilers
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TflYolo3.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:plug_static_index_html, "~> 1.0"},
      {:jason, "~> 1.1"},
      {:elixir_make, "~> 0.6.2", runtime: false},
      {:cimg, path: "../cimg"},
    ]
  end
end
