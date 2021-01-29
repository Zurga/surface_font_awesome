# Surface FontAwesome

This library provides components that implement FontAwsome 5 functionality. Currently supported is:

-   Icons
-   Duotone Icons
-   Icon layering (including text layers)
-   Icon counters

The FontAwesome 5 library is not included and should be included in your templates by yourself.

## Example usage

```elixir
alias SurfaceFontAwesome.Icon, as: FA
alias SurfaceFontAwesome.Layers
alias SurfaceFontAwesome.TextLayer


~H"""
<FA icon="camera" />
"""

~H"""
<Layers>
    <FA icon="calendar">
    <TextLayer>28</TextLayer>
</Layers>
"""
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `surface_font_awesome` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:surface_font_awesome, "~> 0.1.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/surface_font_awesome](https://hexdocs.pm/surface_font_awesome).

## Developer usage

If you wish to integrate the FontAwesome elements into your own app or framework and you can `use SurfaceFontAwesome, element` in your component to
bring all the props that SurfaceFontAwesome elements require.

For example, one might want to create an Input with an `<Icon>` next to it:

```
defmodule IconInput do
  use SurfaceFontAwesome, :icon
  alias SurfaceFontAwesome.Icon

  prop placeholder, :string

  def render(assigns) do
    ~H"""
      <div>{{ Icon.render(assigns) }}<input placeholder={{@placeholder}} /></div>
    """
  end
end
```
