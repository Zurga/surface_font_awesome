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
]
  defmacro __using__(_) do
    quote do
      use Surface.Component

      @sizes ~w/xs sm lg 2x 3x 4x 5x 6x 7x 8x 9x 10x/
      @doc "The size of the icon"
      prop size, :string, values: @sizes

      @doc """
      Transformations of the icon. Use `rotate-#`, `grow-#`, `shrink-#`, `flip-v`, `flip-h`,
      `right-#`, `left-#`, `up-#`, `down-#` in any combination. 
      Rotations are in degrees, placement and scaling are in 1/16th `em`.
      """
      prop transform, :string

      @doc "The style that can be applied"
      prop style, :string, default: ""

      @doc "The css classes that can be set"
      prop class, :css_class
    end
  end
end
