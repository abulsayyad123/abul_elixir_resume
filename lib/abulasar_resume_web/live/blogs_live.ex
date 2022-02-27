defmodule AbulasarResumeWeb.BlogsLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.Blog
  alias AbulasarResumeWeb.BlogsDetailLive

  def mount(_params, _session, socket) do
    {:ok, blogs} = Blog.get_blogs()
    blogs = get_in(blogs.body, ["data", "user", "publication", "posts"])
    socket = assign(socket, blogs: blogs, page_no: 0)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <section class="pt-page pt-page-current" data-id="blog">
        <div class="section-inner custom-page-content">
          <div class="page-header color-1">
            <h2>Blog</h2>
          </div>
          <div class="page-content">
            <div class="blog-masonry two-columns">
              <%= for blog <- @blogs do %>
                <div class="item">
                    <div class="blog-card">
                      <div class="media-block">
                        <%= live_patch to: Routes.live_path(@socket, BlogsDetailLive, blog["slug"]) do %>
                          <img class="post-image img-responsive" src=<%= blog["coverImage"] %> alt="blog-post-1" />
                          <div class="mask"></div>
                          <div class="post-date"><span class="day">6</span><span class="month">Dec</span><!--<span class="year">2016</span>--></div>
                        <% end %>
                      </div>
                      <div class="post-info">
                        <ul class="category">
                          <li><a href="#">Travel</a></li>
                        </ul>
                        <a><h4 class="blog-item-title"><%= blog["title"] %></h4></a>
                      </div>
                    </div>
                </div>
              <% end %>
            </div>
            <button phx-click="load_more">Load More</button>
          </div>
        </div>
      </section>
    """
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
