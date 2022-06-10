defmodule AbulasarResumeWeb.BackgroundLoaderComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    brightness = assigns.brightness
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
