defmodule SimpleFormat.Mixfile do
  use Mix.Project

  def project do
    [app: :simple_format,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :phoenix_html]]
  end

  defp deps do
    [{:phoenix_html, "~> 2.2"}]
  end
end
