defmodule SurfaceFontAwesome.LayerTest do
  use ExUnit.Case, async: true

  alias SurfaceFontAwesome.Icon, as: FA, warn: false
  alias SurfaceFontAwesome.Layers, as: FALayers, warn: false
  alias SurfaceFontAwesome.{TextLayer, CounterLayer}, warn: false

  import ComponentTestHelper

  test "layered icons" do
    code = """
    <FALayers>
      <FA icon="camera" size="1x" />
      <FA icon="ban" size="2x"/>
    </FALayers>
    """

    assert render_live(code) =~
             """
             <span class="fa-layers fa-fw">
             <i class="fas fa-camera fa-1x"></i>
             <i class="fas fa-ban fa-2x"></i>
             </span>
             """
             |> String.replace("\n", "")
  end

  test "layered icons with styles" do
    code = """
    <FALayers style="background: blue">
      <FA icon="camera" size="1x" />
      <FA icon="ban" size="2x"/>
    </FALayers>
    """

    assert render_live(code) =~
             """
             <span class="fa-layers fa-fw" style="background: blue">
             <i class="fas fa-camera fa-1x"></i>
             <i class="fas fa-ban fa-2x"></i>
             </span>
             """
             |> String.replace("\n", "")
  end

  test "add text layer with icons" do
    code = """
    <FALayers>
      <FA icon="calendar"/>
      <TextLayer class="fa-inverse" transform="shrink-8 down-3" style="font-weight:900">27</TextLayer>
    </FALayers>
    """

    assert render_live(code) =~
             """
             <span class="fa-layers fa-fw">
             <i class="fas fa-calendar"></i>
             <span data-fa-transform="shrink-8 down-3" class="fa-layers-text fa-inverse" style="font-weight: 900">27</span>
             </span>
             """
             |> String.replace("\n", "")
  end

  test "add counter layer" do
    code = """
    <FALayers>
      <FA icon="calendar"/>
      <CounterLayer position="top-right" transform="shrink-8 down-3" style="font-weight:900">27</CounterLayer>
    </FALayers>
    """

    assert render_live(code) =~
             """
             <span class="fa-layers fa-fw">
             <i class="fas fa-calendar"></i>
             <span data-fa-transform="shrink-8 down-3" class="fa-layers-counter fa-layers-top-right" style="font-weight: 900">27</span>
             </span>
             """
             |> String.replace("\n", "")
  end
end
