defmodule TddDeathStar.PlanetFeatureTest do
  use TddDeathStar.ConnCase
  use Hound.Helpers
  require Forge

  hound_session

  setup context do
    {:ok, (Forge.saved_planet_list TddDeathStar.Repo, 5)}
  end

  test "GET /" do
    navigate_to "/"
    assert page_source =~ "Welcome to The Death Star"
  end

  test "Visit Planet List" do
    url = "http://localhost:4001/planets"

    navigate_to "/"
    link = find_element :class, "target-list"
    click link
    assert current_url == url
    tables = find_all_elements(:tag, "tr")
    assert length(tables) == 6
  end

  test "Destroy Planet" do
   navigate_to "/"
   list_link = find_element :class, "target-list"
   click list_link
   button = find_element :class, "destroy"
   click button
   tables = find_all_elements(:tag, "tr")
   assert length(tables) == 5
   navigate_to "/"
   destroy_link = find_element :class, "destroyed-planet"
   click destroy_link
   tables = find_all_elements(:tag, "tr")
   assert length(tables) == 6
  end

  test "Delete Planet" do
   navigate_to "/"
   link = find_element :class, "target-list"
   click link
   button = find_element :class, "delete"
   click button
   accept_dialog()
   tables = find_all_elements(:tag, "tr")
   assert length(tables) == 5
  end

  test "Create Planet" do
    navigate_to "/"
    link = find_element :class, "target-planet"
    click link
    fill_field({:name, "planet[name]"}, "Alderaan")
    fill_field({:name, "planet[x]"}, "42")
    fill_field({:name, "planet[y]"}, "42")
    fill_field({:name, "planet[z]"}, "42")
    fill_field({:name, "planet[description]"}, "A nice planet that is totally not rebelling.")
    button = find_element :class, "btn"
    click button
    navigate_to "/planets"
    tables = find_all_elements(:tag, "tr")
    assert length(tables) == 7
  end
end
