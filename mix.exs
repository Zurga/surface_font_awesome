defmodule SurfaceFontAwesome.MixProject do
  use Mix.Project

  @version "0.1.1"
  @source_url "https://github.com/Zurga/surface_font_awesome"

  def project do
    [
      app: :surface_font_awesome,
      version: @version,
      elixir: "~> 1.8",
      description: "FontAwesome implemented with Surface components",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: %{licenses: ["MIT"], links: %{"Github" => @source_url}}
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:surface, "~> 0.2.0"},
      {:surface_formatter, git: "https://github.com/surface-ui/surface_formatter"},
      {:floki, ">= 0.27.0", only: :test},
      {:ex_doc, ">= 0.19.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "SurfaceFontAwesome",
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
