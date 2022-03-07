defmodule AbulasarResumeWeb.InitAssigns do
  import Phoenix.LiveView
  alias AbulasarResumeWeb.Router.Helpers, as: Routes

  def on_mount(:default, _params, _session, socket) do
    IO.puts "CALLED AGAIN"
    socket =
      assign(socket,
        nav_menu: [
          {"Home", Routes.home_page_path(socket, :index)},
          {"Resume", Routes.resume_path(socket, :index)},
          {"Blogs", Routes.blogs_path(socket, :index)},
          {"Contact", Routes.contact_path(socket, :index)}
        ],
        show_menu: false,
        hide_class: "mobile-menu-hide"
      )

    {:cont,
      socket
      |> attach_hook(:set_left_menu_active_path, :handle_params, &handle_active_tabs/3)
      |> attach_hook(:toggle_side_drawer_menu, :handle_event, &handle_event/3)}
  end

  def handle_active_tabs(_params, url, socket) do
    {:cont, assign(socket, nav_menu_path: URI.parse(url).path)}
  end

  defp handle_event("toggle_menu", _params, socket) do
    show_menu = !socket.assigns.show_menu
    hide_class = if show_menu, do: "", else: "mobile-menu-hide"
    socket =
        socket
        |> assign(:show_menu, show_menu)
        |> assign(:hide_class, hide_class)
    {:halt, socket}
  end

  defp handle_event(_, _, socket), do: {:cont, socket}
end
