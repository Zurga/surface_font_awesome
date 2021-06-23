defmodule SurfaceFontAwesome.TextLayer do
  @doc """
  A component that represents a text layer to be overlayed on icons.

  Example:
  ```elixir
  ~F\"\"\"
    <Layers>
      <Icon icon="sms">
      <TextLayer>New text!</TextLayer>
    </Layers>
  \"\"\"
  ```

  """
  use SurfaceFontAwesome

  slot default

  def render(assigns) do
    transforms = (assigns.transform && %{"data-fa-transform": assigns.transform || ""}) || %{}

    ~F"""
    <span class={"fa-layers-text", @class} {...transforms} style={@style}><#slot /></span>
    """
  end
end
