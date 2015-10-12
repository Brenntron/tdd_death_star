defmodule TddDeathStar.PlanetControllerTest do
  use TddDeathStar.ConnCase

  alias TddDeathStar.Planet
  @valid_attrs %{name: "Alderaan", description: "A nice little planet that is totally not rebelling.", destroyed: false, x: 42, y: 42, z: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, planet_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing planets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, planet_path(conn, :new)
    assert html_response(conn, 200) =~ "New planet"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, planet_path(conn, :create), planet: @valid_attrs
    assert redirected_to(conn) == planet_path(conn, :index)
    assert Repo.get_by(Planet, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, planet_path(conn, :create), planet: @invalid_attrs
    assert html_response(conn, 200) =~ "New planet"
  end

  test "shows chosen resource", %{conn: conn} do
    planet = Repo.insert! %Planet{}
    conn = get conn, planet_path(conn, :show, planet)
    assert html_response(conn, 200) =~ "Show planet"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, planet_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    planet = Repo.insert! %Planet{}
    conn = get conn, planet_path(conn, :edit, planet)
    assert html_response(conn, 200) =~ "Edit planet"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    planet = Repo.insert! %Planet{}
    conn = put conn, planet_path(conn, :update, planet), planet: @valid_attrs
    assert redirected_to(conn) == planet_path(conn, :show, planet)
    assert Repo.get_by(Planet, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    planet = Repo.insert! %Planet{}
    conn = put conn, planet_path(conn, :update, planet), planet: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit planet"
  end

  test "deletes chosen resource", %{conn: conn} do
    planet = Repo.insert! %Planet{}
    conn = delete conn, planet_path(conn, :delete, planet)
    assert redirected_to(conn) == planet_path(conn, :index)
    refute Repo.get(Planet, planet.id)
  end
end
