require 'test_helper'
require "controllers/controller_test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  include ControllerTestHelper

  setup do
    @organization = organizations(:one)
    @user = users(:one)
    login_user_post(@user)
  end

  test "should get index" do
    login_user_post(@user)
    get organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: {
        organization: { name: "Newly minted organization" } }
    end

    assert_redirected_to organization_help_desks_path(Organization.last)
  end

  test "should show organization" do
    get organization_url(@organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: {
      name: "Updated organization" } }
    assert_redirected_to organization_url(@organization)
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
