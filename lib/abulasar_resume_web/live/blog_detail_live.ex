defmodule AbulasarResumeWeb.BlogsDetailLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.Blog
  alias AbulasarResumeWeb.BlogView

  def mount(%{"slug" => slug}, _session, socket) do
    {:ok, blog} = Blog.get_detail_blog(slug)
    blog = get_in(blog.body, ["data", "post"])
    IO.inspect(blog)
    socket = assign(socket, blog: blog)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="single-page-content">
        <div class="content-area">
          <div class="page-content">
            <!-- Blog Entry Content -->
            <div class="blog-post-main-image">
              <img class="post-image img-responsive" src={BlogView.cover_image(@blog)} alt="blog-post-1" />
            </div>

            <div class="blog-post-content">
              <h1><%= @blog["title"] %></h1>

              <div class="entry-meta">
                <span class="date"><a href="#"><i class="fa fa-fw fa-clock-o"></i> 12 December, 2016</a></span>
                <span class="divider">|</span>
                <span class="autor"><a href="#"><i class="fa fa-fw fa-user"></i> AbulAsar S.</a></span>
              </div>

              <%= raw(@blog["content"]) %>

              <div class="entry-meta entry-tags-share">
                <ul class="tags">
                  <%= for tag <- @blog["tags"] do %>
                    <li><a><%= tag["name"] %></a></li>
                  <% end %>
                </ul>
              </div>
            </div>
            <!-- End of Blog Entry Content -->
          </div>
        </div>
      </div>
    """
  end
end
