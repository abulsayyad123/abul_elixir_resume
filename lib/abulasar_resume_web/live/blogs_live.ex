defmodule AbulasarResumeWeb.BlogsLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.Blog
  import AbulasarResumeWeb.BlogView

  def mount(_params, _session, socket) do
    {:ok, blogs} = Blog.get_blogs()
    blogs = get_in(blogs.body, ["data", "user", "publication", "posts"])
    socket = assign(socket, blogs: blogs, page_no: 0)
    {:ok, socket}
  end

  def handle_event("load_more", _params, socket) do
    page_no = socket.assigns.page_no + 1
    {:ok, blogs} = Blog.get_blogs(page_no)
    new_blogs = get_in(blogs.body, ["data", "user", "publication", "posts"])
    blogs = socket.assigns.blogs ++ new_blogs
    socket = assign(socket, blogs: blogs, page_no: page_no)
    {:noreply, socket}
  end
end
