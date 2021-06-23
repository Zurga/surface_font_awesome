defmodule SurfaceFontAwesome.Icon do
  @moduledoc """
  A component that displays an icon compatible with the FontAwesome icons

  Examples:
  ```elixir
  ~F\"\"\"
    <FA icon="camera" />
  \"\"\"
  ```
  <i class="fas fa-camera"></i>
  The values for the icon names are
  """

  use SurfaceFontAwesome, :icon

  def render(%{rotate: rotate, flip: flip} = assigns)
      when not is_nil(rotate) and not is_nil(flip) do
    ~F"""
    <span class={"fa-flip-#{@flip}"}>
      {render(Map.put(assigns, :flip, nil))}
    </span>
    """
  end

  @style_attrs ~w/primary_color secondary_color primary_opacity secondary_opacity/a
  def render(assigns) do
    attrs = %{
      "data-fa-transform": assigns.transform || "",
      "data-fa-mask": (assigns.mask && "fas fa-#{assigns.mask}") || ""
    }

    style =
      case assigns.icon_style |> String.downcase() do
        "duotone" ->
          Enum.reduce(@style_attrs, Map.get(assigns, :style, ""), fn attr, acc ->
            if value = Map.get(assigns, attr) do
              key = String.replace(to_string(attr), "_", "-")
              acc <> "--fa-#{key}: #{value};"
            else
              acc
            end
          end)

        _ ->
          Map.get(assigns, :style, "")
      end

    fa_class = "fa" <> (assigns.icon_style |> String.first() |> String.downcase())

    ~F"""
    <i
      class={
        fa_class,
        "fa-#{@icon}",
        "fa-#{@size}": @size,
        "fa-rotate-#{@rotate}": @rotate,
        "fa-flip-#{@flip}": @flip
      }
      {...attrs}
      style={style}
    />
    """
  end

  @doc "Returns the supported icon names that can be used for the icon and mask props"
  def icon_names(), do: @icon_names
end
