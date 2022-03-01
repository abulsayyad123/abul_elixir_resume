defmodule AbulasarResumeWeb.BlogsDetailLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.Blog
  import AbulasarResumeWeb.BlogView

  def mount(%{"slug" => slug}, _session, socket) do
    {:ok, blog} = Blog.get_detail_blog(slug)
    blog = get_in(blog.body, ["data", "post"])
    socket = assign(socket, blog: blog)
    {:ok, socket}
  end
end
