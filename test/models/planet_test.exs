defmodule TddDeathStar.PlanetTest do
  use TddDeathStar.ModelCase

  alias TddDeathStar.Planet

  @valid_attrs %{name: "Alderaan", description: "A peaceful little planet that is totally not rebelling.", destroyed: false, x: 42, y: 42, z: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Planet.changeset(%Planet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Planet.changeset(%Planet{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with wrong numbers" do
    attrs = %{@valid_attrs | x: -42}
    changeset = Planet.changeset(%Planet{}, attrs)
    refute changeset.valid?
  end

  test "Changeset with short description" do
    attrs = %{@valid_attrs | description: "I"}
    changeset = Planet.changeset(%Planet{}, attrs)
    refute changeset.valid?
  end

  test "Changeset without description" do
    changeset = Planet.changeset(%Planet{}, Map.delete(@valid_attrs, :description))
    assert changeset.valid?
  end
end
