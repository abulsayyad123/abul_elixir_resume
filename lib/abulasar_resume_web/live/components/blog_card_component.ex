defmodule AbulasarResumeWeb.BlogCardComponent do
  use Phoenix.LiveComponent
  alias AbulasarResumeWeb.Router.Helpers, as: Routes
  import AbulasarResumeWeb.BlogView
  import Phoenix.HTML

  def mount(socket) do
    {:ok, assign(socket, set_loading: false)}
  end
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
            <i class="fa fa-plus" aria-hidden="true" phx-click="load_more_data" phx-target={@myself}></i>
            <%= if @set_loading do %>
              <i class="fa fa-spinner" aria-hidden="true" style="animation: rotation 2s infinite linear;"></i>
            <% end %>
          </div>
        </div>
      </div>
    """
  end

  @impl true
  def handle_event("load_more_data", _params, socket) do
    send_update(__MODULE__, id: socket.assigns.id, action: :query_data)
    socket = assign(socket, set_loading: true)
    {:noreply, socket}
  end

  @impl true
  def update(%{action: :query_data}, socket) do
    IO.puts "CALLED>>>>"
    Process.sleep(3000)
    socket = assign(socket, action: nil, set_loading: false)
    {:ok, socket}
  end

  @impl true
  def update(regular_assigns, socket) do
    {:ok, assign(socket, regular_assigns)}
  end
end
