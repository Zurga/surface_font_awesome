ExUnit.start()

defmodule Router do
  use Phoenix.Router
end

defmodule Endpoint do
  use Phoenix.Endpoint, otp_app: :surface
  plug(Router)
end

Application.put_env(:surface, Endpoint,
  secret_key_base: "supersecret",
  live_view: [
    signing_salt: "saltyverysalty"
  ]
)

Endpoint.start_link()

defmodule ComponentTestHelper do
  require Phoenix.LiveViewTest

  @endpoint Endpoint

  defmacro render_live(code, assigns \\ quote(do: %{})) do
    quote do
      render_live(unquote(code), unquote(assigns), unquote(Macro.escape(__CALLER__)))
    end
  end

  def render_live(module, assigns, _env) when is_atom(module) do
    conn = Phoenix.ConnTest.build_conn()
    {:ok, _view, html} = Phoenix.LiveViewTest.live_isolated(conn, module, session: assigns)

    clean_html(html)
  end

  def render_live(code, assigns, env) do
    id = :erlang.unique_integer([:positive]) |> to_string()

    view_code = """
    defmodule TestLiveView_#{id} do; \
      use Surface.LiveView; \
      def render(assigns) do; \
        assigns = Map.merge(assigns, #{inspect(assigns)}); \
        ~F(#{code}); \
      end; \
    end\
    """

    {{:module, module, _, _}, _} = Code.eval_string(view_code, [], %{env | file: "code", line: 0})
    conn = Phoenix.ConnTest.build_conn()
    {:ok, _view, html} = Phoenix.LiveViewTest.live_isolated(conn, module)

    clean_html(html)
  end

  defp clean_html(html) do
    html
    |> String.replace(~r/^<div.+>/U, "")
    |> String.replace(~r/<\/div>$/, "\n")
    |> String.replace(~r/\n+/, "\n")
    |> String.replace(~r/\n\s+\n/, "\n")
  end
end
