defmodule SurfaceFontAwesome.TextLayer do
  @moduledoc """
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

  data transforms, :any
  slot default

  def render(assigns) do
    assigns =
      assign(
        assigns,
        :transforms,
        (assigns.transform && %{"data-fa-transform": assigns.transform || ""}) || %{}
      )

    ~F"""
    <span class={"fa-layers-text", @class} {...@transforms} style={@style}><#slot /></span>
    """
  end
end
