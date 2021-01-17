defmodule SurfaceFontAwesome.TextLayer do
  use SurfaceFontAwesome

  slot default

  def render(assigns) do
    transforms = (assigns.transform && %{"data-fa-transform": assigns.transform || ""}) || %{}

    ~H"""
    <span class={{"fa-layers-text", @class}} :attrs={{transforms}} style={{@style}}><slot /></span>
    """
  end
end
