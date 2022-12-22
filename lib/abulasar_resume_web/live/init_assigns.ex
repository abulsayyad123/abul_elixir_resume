defmodule AbulasarResumeWeb.InitAssigns do
  import Phoenix.LiveView
  import Phoenix.Component
  alias AbulasarResumeWeb.Router.Helpers, as: Routes

  def on_mount(:default, _params, _session, socket) do
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
    }
  end

  def handle_active_tabs(_params, url, socket) do
    {:cont, assign(socket, nav_menu_path: URI.parse(url).path)}
  end
end
