defmodule AbulasarResumeWeb.BlogsDetailLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.BlogPosts.Blog
  import AbulasarResumeWeb.BlogView

  def mount(%{"slug" => slug}, _session, socket) do
    blog = Blog.get_detail_blog(slug)
    socket = assign(socket, blog: blog)
    {:ok, socket}
  end
end
