defmodule AbulasarResumeWeb.InitAssigns do
  import Phoenix.LiveView
  alias AbulasarResumeWeb.Router.Helpers, as: Routes

  def on_mount(:default, _params, _session, socket) do
    socket =
      assign(socket,
        nav_menu: [
          {"Home", Routes.home_page_path(socket, :index)},
          {"Resume", Routes.resume_path(socket, :index)},
          {"Blogs", Routes.blogs_path(socket, :index)},
          {"Contact", Routes.contact_path(socket, :index)}
        ]
      )

    socket =
      attach_hook(socket, :set_left_menu_active_path, :handle_params, fn
        _params, url, socket ->
          {:cont, assign(socket, nav_menu_path: URI.parse(url).path)}
      end)

    {:cont, socket}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end
end
