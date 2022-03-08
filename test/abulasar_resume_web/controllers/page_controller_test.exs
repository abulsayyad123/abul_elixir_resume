defmodule AbulasarResumeWeb.PageControllerTest do
  use AbulasarResumeWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert true
  end
end
