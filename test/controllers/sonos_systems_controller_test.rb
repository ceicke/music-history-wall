require "test_helper"

class SonosSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sonos_system = sonos_systems(:one)
  end

  test "should get index" do
    get sonos_systems_url
    assert_response :success
  end

  test "should get new" do
    get new_sonos_system_url
    assert_response :success
  end

  test "should create sonos_system" do
    assert_difference('SonosSystem.count') do
      post sonos_systems_url, params: { sonos_system: { ip: @sonos_system.ip, name: @sonos_system.name } }
    end

    assert_redirected_to sonos_system_url(SonosSystem.last)
  end

  test "should show sonos_system" do
    get sonos_system_url(@sonos_system)
    assert_response :success
  end

  test "should get edit" do
    get edit_sonos_system_url(@sonos_system)
    assert_response :success
  end

  test "should update sonos_system" do
    patch sonos_system_url(@sonos_system), params: { sonos_system: { ip: @sonos_system.ip, name: @sonos_system.name } }
    assert_redirected_to sonos_system_url(@sonos_system)
  end

  test "should destroy sonos_system" do
    assert_difference('SonosSystem.count', -1) do
      delete sonos_system_url(@sonos_system)
    end

    assert_redirected_to sonos_systems_url
  end
end
