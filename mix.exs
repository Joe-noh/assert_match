defmodule ExUnitAssertMatch.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ex_unit_assert_match,
      name: "ExUnitAssertMatch",
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      source_url: github_url(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "A package helps to assert that given data match expected structure."
  end

  defp package do
    [
      name: "ex_unit_assert_match",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{
        "GitHub" => github_url()
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: github_url(),
      extras: ["README.md"]
    ]
  end

  defp github_url do
    "https://github.com/Joe-noh/ex_unit_assert_match"
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
