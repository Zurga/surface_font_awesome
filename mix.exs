defmodule SurfaceFontAwesome.MixProject do
  use Mix.Project

  @version "0.1.4"
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
      {:surface, ">= 0.3.0 and < 0.5.0"},
      {:surface_formatter, ">= 0.3.0 and < 0.5.0"},
      {:floki, ">= 0.27.0", only: :test},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "SurfaceFontAwesome",
      source_ref: "v#{@version}",
      source_url: @source_url,
      before_closing_head_tag: &add_fontawesome/1
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp add_fontawesome(:html) do
    "<script src=\"https://use.fontawesome.com/releases/v5.0.0/js/all.js\"></script>"
  end

  defp add_fontawesome(_), do: ""
end
