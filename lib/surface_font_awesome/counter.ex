defmodule SurfaceFontAwesome.CounterLayer do
  @doc """
  This component will display a counter. It can be put on top of other icons by adding it to a `<Layers>` component.
  Whatever is put inside the default slot will be the value of the counter.
  Positioning of the counter can be done using its `position` prop.

  Example:
  ```elixir
  ~F\"\"\"
    <Layers>
      <Icon icon="sms">
      <CounterLayer position="top-right">233</CounterLayer>
    </Layers>
  \"\"\"
  ```
  """

  use SurfaceFontAwesome, :counter_layer

  def render(assigns) do
    transforms = (assigns.transform && %{"data-fa-transform": assigns.transform || ""}) || %{}

    ~F"""
    <span
      class={"fa-layers-counter", @class, "fa-layers-#{@position}": @position}
      {...transforms}
      style={@style}
    ><#slot /></span>
    """
  end
end
