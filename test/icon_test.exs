defmodule Surface.Components.IconTest do
  use ExUnit.Case, async: true

  alias SurfaceFontAwesome.Icon, as: FA, warn: false
  import ComponentTestHelper

  test "basic icon usage" do
    code = """
    <FA icon="500px" />
    """

    assert render_live(code) =~ """
           <i class="fas fa-500px"></i>
           """
  end

  test "set icon size" do
    code = """
    <FA icon="500px" size="4x"/>
    """

    assert render_live(code) =~ """
           <i class="fas fa-500px fa-4x"></i>
           """
  end

  test "transformations of the icon" do
    code = """
    <FA icon="500px" transform="grow-10 left-20"/>
    """

    assert render_live(code) =~ """
           <i data-fa-transform="grow-10 left-20" class="fas fa-500px"></i>
           """
  end

  test "setting the primary color without duotone icon should be ignored" do
    code = """
    <FA icon="camera" primary_color="blue" />
    """

    assert render_live(code) =~ """
           <i class="fas fa-camera"></i>
           """
  end

  test "setting the primary opacity and secondary color" do
    code = """
    <FA icon="camera" icon_style="duotone" secondary_color="blue" primary_opacity={{0.6}} />
    """

    assert render_live(code) =~ """
           <i class="fad fa-camera" style="--fa-secondary-color: blue; --fa-primary-opacity: 0.6"></i>
           """
  end

  test "masking of icons" do
    code = """
    <FA icon="pencil-alt" transform="shrink-10 up-.5" mask="comment" style="background: MistyRose"/>
    """

    assert render_live(code) =~ """
           <i data-fa-mask="fas fa-comment" data-fa-transform="shrink-10 up-.5" class="fas fa-pencil-alt" style="background: MistyRose"></i>
           """
  end

  test "rotating icons" do
    code = """
      <FA icon="camera" rotate="90" />
    """

    assert render_live(code) =~ """
           <i class="fas fa-camera fa-rotate-90"></i>
           """
  end

  test "flipping icons" do
    code = """
      <FA icon="camera" flip="vertical" />
    """

    assert render_live(code) =~ """
           <i class="fas fa-camera fa-flip-vertical"></i>
           """
  end

  test "flipping and rotating icons" do
    code = """
      <FA icon="camera" flip="vertical" rotate="90"/>
    """

    assert render_live(code) =~ """
           <span class="fa-flip-vertical"><i class="fas fa-camera fa-rotate-90"></i></span>
           """
  end
end
