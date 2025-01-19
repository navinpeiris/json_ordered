defmodule JSONOrdered.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/navinpeiris/json_ordered"

  def project do
    [
      app: :json_ordered,
      version: @version,
      name: "JSONOrdered",
      description:
        "A simple struct and encoder for the Elixir 1.18+ that allows you to encode JSON data with the keys in the specified order.",
      source_url: @source_url,
      homepage_url: @source_url,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      package: package(),
      docs: docs(),
      test_coverage: [
        summary: [threshold: 100]
      ],
      preferred_cli_env: [ci: :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # dev/test dependencies
      {:ex_doc, "~> 0.34", only: :dev, runtime: false},
      {:ex_unit_notifier, "~> 1.2", only: :test},
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Navin Peiris"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: [
        "README.md"
      ]
    ]
  end

  defp aliases do
    [
      ci: [
        "compile --warnings-as-errors --force",
        "format --check-formatted",
        "test --cover --raise",
        "credo"
      ]
    ]
  end
end
