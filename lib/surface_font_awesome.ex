defmodule SurfaceFontAwesome do
  @moduledoc ~s[
This library provides components that implement FontAwsome 5 functionality. Currently supported are

-   Icons
-   Dualtone Icons
-   Icon layering (including text layers)
-   Icon counters

## Example usage

```elixir
alias SurfaceFontAwesome.Icon, as: FA
alias SurfaceFontAwesome.Layers
alias SurfaceFontAwesome.TextLayer


~F"""
<FA icon="camera" />
"""

~F"""
<Layers>
  <FA icon="calendar" />
  <TextLayer>28</TextLayer>
</Layers>
"""
```
]

  defmacro __using__([]) do
    quote do
      use Surface.Component

      @doc "The size of the icon"
      prop size, :string,
        values: ["xs", "sm", "lg", "2x", "3x", "4x", "5x", "6x", "7x", "8x", "9x", "10x"]

      @doc """
      Transformations of the icon. Use `rotate-#`, `grow-#`, `shrink-#`, `right-#`, `left-#`, `up-#`, `down-#` in any combination. 
      Rotations are in degrees, placement and scaling are in 1/16th `em`
      """
      prop transform, :string

      @doc "Styles for the component"
      prop style, :string, default: ""

      @doc "CSS classes for the component"
      prop class, :css_class
    end
  end

  defmacro __using__(:icon) do
    quote do
      use SurfaceFontAwesome

      @icon_names :code.priv_dir(:surface_font_awesome)
                  |> Path.join("font-awesome-icons.txt")
                  |> File.read!()
                  |> String.split("\n")
                  |> Enum.flat_map(fn line ->
                    [style | names] = String.split(line, " ")
                    Enum.map(names, &{&1, style})
                  end)
                  |> Enum.into(%{})

      @doc "The icon to display"
      prop icon, :string, required: true, values: Map.keys(@icon_names)

      @doc "Specifies if the icon should be animated and which animation to use"
      prop animated, :string, values: ["spin", "pulse"]

      @doc "Specifies the style of the icon. Allows for the selection of Pro icon styles"
      prop icon_style, :string, default: "", values: ["solid", "regular", "light", "duotone"]

      @doc "Sets a mask to use with the icon"
      prop mask, :string, values: Map.keys(@icon_names)

      @doc "Set the rotation of the icon with predefined angles"
      prop rotate, :string, values: ["90", "180", "270"]

      @doc "Flip the icon on a certain axis, or both (to mirror)"
      prop flip, :string, values: ["horizontal", "vertical", "both"]

      @doc "Primary color of the icon, if a duotone icon style is chosen, otherwise this is ignored"
      prop primary_color, :string

      @doc "Secondary color of the icon, if a duotone icon style is chosen, otherwise this is ignored"
      prop secondary_color, :string

      @doc "Primary opacity of the icon, if a duotone icon style is chosen, otherwise this is ignored"
      prop primary_opacity, :decimal

      @doc "Secondary opacity of the icon, if a duotone icon style is chosen, otherwise this is ignored"
      prop secondary_opacity, :decimal
    end
  end

  defmacro __using__(layers) when layers in ~w/layers text_layer/a do
    quote do
      use SurfaceFontAwesome
      slot default
    end
  end

  defmacro __using__(:counter_layer) do
    quote do
      use SurfaceFontAwesome

      prop position, :string, values: ["bottom-left", "bottom-right", "top-left", "top-right"]

      slot default
    end
  end
end
