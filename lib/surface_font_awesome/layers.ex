defmodule SurfaceFontAwesome.Layers do
  @moduledoc """
  A wrapping component support the layering of icons.
  """

  use Surface.Component

  slot default

  prop style, :string, default: ""

  def render(assigns) do
    ~H"""
    <span class="fa-layers fa-fw" style={{@style}}>
      <slot/>
    </span>
    """
  end
end
