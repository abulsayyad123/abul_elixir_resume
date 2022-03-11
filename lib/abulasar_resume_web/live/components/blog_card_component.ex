defmodule AbulasarResumeWeb.BlogCardComponent do
  use Phoenix.LiveComponent
  alias AbulasarResumeWeb.Router.Helpers, as: Routes
  import AbulasarResumeWeb.BlogView
  import Phoenix.HTML


  def render(assigns) do
    ~H"""
      <div class="item">
        <div class="blog-card">
          <div class="media-block">
            <%= live_patch to: Routes.blogs_detail_path(@socket, :index, @blog["slug"]) do %>
              <img class="post-image img-responsive" src={cover_image(@blog)} alt="@blog-post-1" />
              <div class="mask"></div>
              <div class="post-date"><%= raw(blog_main_date(@blog["dateAdded"])) %></div>
            <% end %>
          </div>
          <div class="post-info">
            <ul class="category">
              <li><a href="#"><%= @blog["type"] %></a></li>
            </ul>
            <a><h4 class="blog-item-title" title={get_title(@blog)} ><%= @blog["title"] %></h4></a>
          </div>
        </div>
      </div>
    """
  end
end
