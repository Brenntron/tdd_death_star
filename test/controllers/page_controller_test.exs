defmodule TddDeathStar.PageControllerTest do
  use TddDeathStar.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to The Death Star!"
  end
end
