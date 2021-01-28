defmodule SurfaceFontAwesome.LayerTest do
  use SurfaceFontAwesome.ConnCase, async: true

  alias SurfaceFontAwesome.Icon
  alias SurfaceFontAwesome.Layers, as: FALayers
  alias SurfaceFontAwesome.{TextLayer, CounterLayer}

  test "layered icons" do
    html =
      render_surface do
        ~H"""
        <FALayers>
          <Icon icon="camera" size="1x" />
          <Icon icon="ban" size="2x" />
        </FALayers>
        """
      end

    assert html =~
             """
             <span class="fa-layers fa-fw">
               <i class="fas fa-camera fa-1x"></i>
               <i class="fas fa-ban fa-2x"></i>
             </span>
             """
  end

  test "layered icons with styles" do
    html =
      render_surface do
        ~H"""
        <FALayers style="background: blue">
          <Icon icon="camera" size="1x" />
          <Icon icon="ban" size="2x" />
        </FALayers>
        """
      end

    assert html =~
             """
             <span class="fa-layers fa-fw" style="background: blue">
               <i class="fas fa-camera fa-1x"></i>
               <i class="fas fa-ban fa-2x"></i>
             </span>
             """
  end

  test "add text layer with icons" do
    html =
      render_surface do
        ~H"""
        <FALayers>
          <Icon icon="calendar" />
          <TextLayer class="fa-inverse" transform="shrink-8 down-3" style="font-weight:900">27</TextLayer>
        </FALayers>
        """
      end

    assert html =~
             """
             <span class="fa-layers fa-fw">
               <i class="fas fa-calendar"></i>
               <span data-fa-transform="shrink-8 down-3" class="fa-layers-text fa-inverse" style="font-weight: 900">27</span>
             </span>
             """
  end

  test "add counter layer" do
    html =
      render_surface do
        ~H"""
        <FALayers>
          <Icon icon="calendar" />
          <CounterLayer position="top-right" transform="shrink-8 down-3" style="font-weight:900">27</CounterLayer>
        </FALayers>
        """
      end

    assert html =~
             """
             <span class="fa-layers fa-fw">
               <i class="fas fa-calendar"></i>
               <span data-fa-transform="shrink-8 down-3" class="fa-layers-counter fa-layers-top-right" style="font-weight: 900">27</span>
             </span>
             """
  end
end
