defmodule AbulasarResumeWeb.BackgroundLoaderComponent do
  use Phoenix.LiveComponent

  # def mount(socket) do
  #   if connected?(socket), do: AbulasarResume.Jobs.JobPubSub.subscribe()
  #   {:ok, socket}
  # end

  # # {:job_progress, %{brightness: current_time}}
  # def handle_info({:job_progress, job_progress}, socket) do
  #   IO.inspect job_progress
  #   # socket = update(socket, :notes, fn notes -> [note | notes] end)
  #   {:noreply, socket}
  # end

  def update(assigns, socket) do
    IO.puts "UPDATE CALLED"
    {:ok, assign(socket, :brightness, assigns[:brightness] || 0)}
  end

  def render(assigns) do
    IO.puts "RENDER CALLED"
    brightness = assigns[:brightness] || 0

    ~H"""
      <div class="light">
        <div class="meter">
          <span style={"width: #{brightness}%"}>
            <%= brightness %>%
          </span>
        </div>
      </div>
    """
  end
end
