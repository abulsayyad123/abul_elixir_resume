defmodule AbulasarResumeWeb.BlogsLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.BlogPosts.Blog
  alias AbulasarResumeWeb.{BlogCardComponent, BackgroundLoaderComponent}

  def mount(_params, _session, socket) do
    blogs = Blog.get_blogs()
    socket = assign(socket, blogs: blogs, page_no: 0)
    {:ok, socket}
  end

  def handle_event("load-blogs", _params, socket) do
    page_no = socket.assigns.page_no + 1
    new_blogs = page_no |> Blog.get_blogs
    blogs = socket.assigns.blogs ++ new_blogs
    socket = assign(socket, blogs: blogs, page_no: page_no)
    {:noreply, socket}
  end

  def handle_event("start_tick", _params, socket) do
    :timer.send_interval(1000, self(), :tick)
    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    brightness = socket.assigns.brightness + 1
    socket = assign(socket, brightness: brightness)
    send_update(BackgroundLoaderComponent, id: "background-loader", brightness: brightness)
    {:noreply, socket}
  end

end
