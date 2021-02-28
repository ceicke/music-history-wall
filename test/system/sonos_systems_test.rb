require "application_system_test_case"

class SonosSystemsTest < ApplicationSystemTestCase
  setup do
    @sonos_system = sonos_systems(:one)
  end

  test "visiting the index" do
    visit sonos_systems_url
    assert_selector "h1", text: "Sonos Systems"
  end

  test "creating a Sonos system" do
    visit sonos_systems_url
    click_on "New Sonos System"

    fill_in "Ip", with: @sonos_system.ip
    fill_in "Name", with: @sonos_system.name
    click_on "Create Sonos system"

    assert_text "Sonos system was successfully created"
    click_on "Back"
  end

  test "updating a Sonos system" do
    visit sonos_systems_url
    click_on "Edit", match: :first

    fill_in "Ip", with: @sonos_system.ip
    fill_in "Name", with: @sonos_system.name
    click_on "Update Sonos system"

    assert_text "Sonos system was successfully updated"
    click_on "Back"
  end

  test "destroying a Sonos system" do
    visit sonos_systems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sonos system was successfully destroyed"
  end
end
