defmodule AbulasarResumeWeb.BlogsLive do
  use AbulasarResumeWeb, :live_view
  alias AbulasarResumeWeb.Blog

  def mount(_params, _session, socket) do
    {:ok, blogs} = Blog.get_blogs()
    blogs = blogs.body["data"]["user"]["publication"]["posts"]
    socket = assign(socket, blogs: blogs )
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
            <!-- Blog Posts Grid -->
            <div class="blog-masonry two-columns">
              <%= for blog <- @blogs do %>
                <div class="item">
                  <div class="blog-card">
                    <div class="media-block">
                      <a href="blog-post-1.html">
                        <img class="post-image img-responsive" src=<%= blog["coverImage"] %> alt="blog-post-1" />
                        <div class="mask"></div>
                        <div class="post-date"><span class="day">6</span><span class="month">Dec</span><!--<span class="year">2016</span>--></div>
                      </a>
                    </div>
                    <div class="post-info">
                      <ul class="category">
                        <li><a href="#">Travel</a></li>
                      </ul>
                      <a href="blog-post-1.html"><h4 class="blog-item-title"><%= blog["title"] %></h4></a>
                    </div>
                  </div>
                </div>
                <!-- End of Blog Post 1 -->
              <% end %>
            </div>
            <!-- Blog Posts Grid -->
          </div>
        </div>
      </section>
    """
  end
end
