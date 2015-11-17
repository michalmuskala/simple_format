defmodule SimpleFormat.Mixfile do
  use Mix.Project

  @github_url "https://github.com/michalmuskala/simple_format"
  @version "0.1.0"

  def project do
    [app: :simple_format,
     version: @version,
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: package,
     description: description,
     docs: docs]
  end

  def application do
    [applications: [:logger, :phoenix_html]]
  end

  defp deps do
    [{:phoenix_html, "~> 2.2"},
     {:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.10", only: :dev}]
  end

  defp package do
    [maintainers: ["Michał Muskała"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => @github_url, "Docs" => "http://hexdocs.pm/simple_format"}]
  end

  defp description do
    """
    Rail's simple_format helper for Phoenix.HTML
    """
  end

  defp docs do
    [extras: ["README.md"],
     source_url: @github_url,
     source_ref: "v#{@version}",
     main: "extra-readme"]
  end
end
