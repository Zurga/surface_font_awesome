defmodule SurfaceFontAwesome.Icon do
  @moduledoc """
  A component that displays an icon compatible with the FontAwesome icons
  """
  use SurfaceFontAwesome

  @icon_names :code.priv_dir(:surface_font_awesome)
              |> Path.join("font-awesome-icons.txt")
              |> File.read!()
              |> String.split("\n")

  @doc "The icon to display"
  prop icon, :string, required: true, values: @icon_names

  @doc "Specifies if the icon should be animated and which animation to use."
  prop animated, :string, values: ~w/spin pulse/

  @doc "Sets a mask to use with the icon"
  prop mask, :string, values: @icon_names

  @doc "Set the primary color of the icon"
  prop primary_color, :string

  @doc "set the secondary color of the icon"
  prop secondary_color, :string

  @doc "Set the primary opacity of the icon"
  prop primary_opacity, :decimal

  @doc "Set the secondary opacity of the icon"
  prop secondary_opacity, :decimal

  @doc "Set the rotation of the icon with predefined angles"
  prop rotate, :string, values: ~w/90 180 270/

  @doc "Flip the icon on a certain axis, or both (to mirror)"
  prop flip, :string, values: ~w/horizontal vertical both/

  def render(%{rotate: rotate, flip: flip} = assigns)
      when not is_nil(rotate) and not is_nil(flip) do
    ~H"""
    <span class={{"fa-flip-#{@flip}"}}>
      {{ render(Map.put(assigns, :flip, nil)) }}
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
      Enum.reduce(@style_attrs, Map.get(assigns, :style, ""), fn attr, acc ->
        if value = Map.get(assigns, attr) do
          key = String.replace(to_string(attr), "_", "-")
          acc <> "--fa-#{key}: #{value};"
        else
          acc
        end
      end)

    ~H"""
    <i class={{"fas", "fa-#{@icon}", 
        "fa-#{@size}": @size, 
        "fa-rotate-#{@rotate}": @rotate,
        "fa-flip-#{@flip}": @flip 
      }} :attrs={{ attrs }} style={{ style }}></i>
    """
  end
end
