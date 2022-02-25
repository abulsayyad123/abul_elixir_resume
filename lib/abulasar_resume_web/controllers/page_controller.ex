defmodule AbulasarResumeWeb.PageController do
  use AbulasarResumeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
