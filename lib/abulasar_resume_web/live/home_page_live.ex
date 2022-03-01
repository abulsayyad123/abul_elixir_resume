defmodule AbulasarResumeWeb.HomePageLive do
  use AbulasarResumeWeb, :live_view

  def mount(params, _session, socket) do
    IO.inspect(params)
    {:ok, socket}
  end
end
