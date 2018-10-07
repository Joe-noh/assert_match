defmodule ExUnitAssertMatch.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_unit_assert_match,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "ExUnitAssertMatch",
      source_url: github_url()
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

  defp package() do
    [
      name: "ex_unit_assert_match",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{
        "GitHub" => github_url()
      }
    ]
  end

  defp github_url do
    "https://github.com/Joe-noh/ex_unit_assert_match"
  end

  defp deps do
    []
  end
end
