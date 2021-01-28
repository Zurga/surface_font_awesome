defmodule SurfaceFontAwesome.Components.IconTest do
  use SurfaceFontAwesome.ConnCase, async: true

  alias SurfaceFontAwesome.Icon

  test "basic icon usage" do
    html =
      render_surface do
        ~H"""
        <Icon icon="500px" />
        """
      end

    assert html =~ """
           <i class="fas fa-500px"></i>
           """
  end

  test "set icon size" do
    html =
      render_surface do
        ~H"""
        <Icon icon="500px" size="4x" />
        """
      end

    assert html =~ """
           <i class="fas fa-500px fa-4x"></i>
           """
  end

  test "transformations of the icon" do
    html =
      render_surface do
        ~H"""
        <Icon icon="500px" transform="grow-10 left-20" />
        """
      end

    assert html =~ """
           <i data-fa-transform="grow-10 left-20" class="fas fa-500px"></i>
           """
  end

  test "setting the primary color without duotone icon should be ignored" do
    html =
      render_surface do
        ~H"""
        <Icon icon="camera" primary_color="blue" />
        """
      end

    assert html =~ """
           <i class="fas fa-camera"></i>
           """
  end

  test "setting the primary opacity and secondary color" do
    html =
      render_surface do
        ~H"""
        <Icon icon="camera" icon_style="duotone" secondary_color="blue" primary_opacity={{ 0.6 }} />
        """
      end

    assert html =~ """
           <i class="fad fa-camera" style="--fa-secondary-color: blue; --fa-primary-opacity: 0.6"></i>
           """
  end

  test "masking of icons" do
    html =
      render_surface do
        ~H"""
        <Icon
          icon="pencil-alt"
          transform="shrink-10 up-.5"
          mask="comment"
          style="background: MistyRose"
        />
        """
      end

    assert html =~ """
           <i data-fa-mask="fas fa-comment" data-fa-transform="shrink-10 up-.5" class="fas fa-pencil-alt" style="background: MistyRose"></i>
           """
  end

  test "rotating icons" do
    html =
      render_surface do
        ~H"""
        <Icon icon="camera" rotate="90" />
        """
      end

    assert html =~ """
           <i class="fas fa-camera fa-rotate-90"></i>
           """
  end

  test "flipping icons" do
    html =
      render_surface do
        ~H"""
        <Icon icon="camera" flip="vertical" />
        """
      end

    assert html =~ """
           <i class="fas fa-camera fa-flip-vertical"></i>
           """
  end

  test "flipping and rotating icons" do
    html =
      render_surface do
        ~H"""
        <Icon icon="camera" flip="vertical" rotate="90" />
        """
      end

    assert html =~ """
           <span class="fa-flip-vertical">
             <i class="fas fa-camera fa-rotate-90"></i>
           </span>
           """
  end
end
