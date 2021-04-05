defmodule SurfaceFontAwesome.Layers do
  @moduledoc """
  A wrapping component support the layering of icons.

  Example:
  ```
  ~H\"\"\"
  <Layers>
    <Icon icon="camera" size="1x" />
    <Icon icon="ban" size="2x" />
  </Layers>
  \"\"\"
  ```

  ### Output

  <span class="fa-layers fa-fw">

  <i class="fas fa-camera fa-1x">
  </i>

  <i class="fas fa-ban fa-2x">
  </i>

  </span>
  """

  use SurfaceFontAwesome, :layers

  def render(assigns) do
    ~H"""
    <span class="fa-layers fa-fw" style={{ @style }}>
      <slot />
    </span>
    """
  end
end
