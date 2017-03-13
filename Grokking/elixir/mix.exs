defmodule Grokking.Mixfile do
  use Mix.Project

  def project do
    [app: :grokking,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 0.6", only: [:dev, :test]},
      {:dialyxir, "~> 0.4", only: [:dev], runtime: false},
      {:uuid, "~> 1.1"}
    ]
  end
end
