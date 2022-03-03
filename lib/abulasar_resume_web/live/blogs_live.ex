defmodule AbulasarResumeWeb.BlogsLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.Blog
  import AbulasarResumeWeb.BlogView

  def mount(_params, _session, socket) do
    blogs = Blog.get_blogs()
    socket = assign(socket, blogs: blogs, page_no: 0)
    {:ok, socket}
  end

  def handle_event("load_more", _params, socket) do
    page_no = socket.assigns.page_no + 1
    new_blogs = page_no |> Blog.get_blogs
    blogs = socket.assigns.blogs ++ new_blogs
    socket = assign(socket, blogs: blogs, page_no: page_no)
    {:noreply, socket}
  end
end
