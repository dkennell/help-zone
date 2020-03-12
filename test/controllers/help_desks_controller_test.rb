require 'test_helper'
require "controllers/controller_test_helper"

class HelpDesksControllerTest < ActionDispatch::IntegrationTest
  include ControllerTestHelper

  setup do
    @help_desk = help_desks(:one)
    @organization = organizations(:one)
    @user = users(:one)
    login_user_post(@user)
  end

  test "should get index" do
    get organization_help_desks_url(@organization)
    assert_response :success
  end

  test "should get new" do
    get new_organization_help_desk_url(@organization)
    assert_response :success
  end

  test "should create help_desk" do
    assert_difference('HelpDesk.count') do
      post organization_help_desks_url(@organization), params: { help_desk: { name: @help_desk.name, organization_id: @help_desk.organization_id } }
    end

    assert_redirected_to help_desk_url(HelpDesk.last)
  end

  test "should show help_desk" do
    get help_desk_url(@help_desk)
    assert_response :success
  end

  test "should get edit" do
    get edit_help_desk_url(@help_desk)
    assert_response :success
  end

  test "should update help_desk" do
    patch help_desk_url(@help_desk), params: { help_desk: { name: @help_desk.name} }
    assert_redirected_to help_desk_url(@help_desk)
  end

  test "should destroy help_desk" do
    assert_difference('HelpDesk.count', -1) do
      delete help_desk_url(@help_desk)
    end

    assert_redirected_to organization_help_desks_url(@organization)
  end
end
