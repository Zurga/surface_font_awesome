defmodule SurfaceFontAwesome.TextLayer do
  @doc """
  A component that represents a text layer to be overlayed on icons.

  Example:
  ```elixir
  ~H\"\"\"
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

    ~H"""
    <span class={{ "fa-layers-text", @class }} :attrs={{ transforms }} style={{ @style }}><slot /></span>
    """
  end
end
