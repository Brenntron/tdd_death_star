defmodule TddDeathStar.PlanetController do
  use TddDeathStar.Web, :controller

  alias TddDeathStar.Planet

  plug :scrub_params, "planet" when action in [:create, :update]

  def index(conn, _params) do
    planets = Repo.all(Planet)
    render(conn, "index.html", planets: planets)
  end

  def new(conn, _params) do
    changeset = Planet.changeset(%Planet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"planet" => planet_params}) do
    changeset = Planet.changeset(%Planet{}, planet_params)

    case Repo.insert(changeset) do
      {:ok, _planet} ->
        conn
        |> put_flash(:info, "Planet created successfully.")
        |> redirect(to: planet_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    planet = Repo.get!(Planet, id)
    render(conn, "show.html", planet: planet)
  end

  def edit(conn, %{"id" => id}) do
    planet = Repo.get!(Planet, id)
    changeset = Planet.changeset(planet)
    render(conn, "edit.html", planet: planet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "planet" => planet_params}) do
    planet = Repo.get!(Planet, id)
    changeset = Planet.changeset(planet, planet_params)

    case Repo.update(changeset) do
      {:ok, planet} ->
        conn
        |> put_flash(:info, "Planet updated successfully.")
        |> redirect(to: planet_path(conn, :show, planet))
      {:error, changeset} ->
        render(conn, "edit.html", planet: planet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    planet = Repo.get!(Planet, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(planet)

    conn
    |> put_flash(:info, "Planet deleted successfully.")
    |> redirect(to: planet_path(conn, :index))
  end
end
