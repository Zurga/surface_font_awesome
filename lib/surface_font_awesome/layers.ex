defmodule SurfaceFontAwesome.Layers do
  @moduledoc """
  A wrapping component support the layering of icons.
  """

  use SurfaceFontAwesome, :layers

  def render(assigns) do
    ~H"""
    <span class="fa-layers fa-fw" style={{@style}}>
      <slot/>
    </span>
    """
  end
end
