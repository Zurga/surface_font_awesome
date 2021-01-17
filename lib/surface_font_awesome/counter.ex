defmodule SurfaceFontAwesome.CounterLayer do
  use SurfaceFontAwesome

  prop position, :string, values: ~w/bottom-left bottom-right top-left top-right/

  slot default

  def render(assigns) do
    transforms = (assigns.transform && %{"data-fa-transform": assigns.transform || ""}) || %{}

    ~H"""
    <span class={{"fa-layers-counter", @class, "fa-layers-#{@position}": @position}} :attrs={{transforms}} style={{@style}}><slot /></span>
    """
  end
end
