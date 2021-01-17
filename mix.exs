defmodule SurfaceFontAwesome.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_font_awesome,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:surface, "~> 0.1.0"},
      {:floki, ">= 0.27.0", only: :test}
    ]
  end
end
