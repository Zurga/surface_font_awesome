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
    <span class={"fa-flip-#{@flip}"} style="display: inline-block">
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
      if String.downcase(assigns.icon_style) == "duotone" do
        Enum.reduce(@style_attrs, Map.get(assigns, :style, ""), fn attr, acc ->
          if value = Map.get(assigns, attr) do
            key = String.replace(to_string(attr), "_", "-")
            acc <> "--fa-#{key}: #{value};"
          else
            acc
          end
        end)
      else
        Map.get(assigns, :style, "")
      end

    fa_class =
      if assigns.icon_style != "" do
        "fa" <> (String.first(assigns.icon_style) |> String.downcase())
      else
        Map.get(@icon_names, assigns.icon, "fas")
      end

    ~F"""
    <i
      class={
        fa_class,
        "fa-#{@icon}",
        "fa-#{@size}": @size,
        "fa-rotate-#{@rotate}": @rotate,
        "fa-flip-#{@flip}": @flip,
        "fa-#{@animated}": @animated
      }
      {...attrs}
      style={style}
    />
    """
  end

  @doc "Returns the supported icon names that can be used for the icon and mask props"
  def icon_names(), do: Map.keys(@icon_names)
end
