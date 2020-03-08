require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "can have a user" do
    organization = organizations(:one)
    user = users(:one)
    organization.users << user
    assert !organization.users.empty?
  end

  test "is invalid without a name" do
    organization = Organization.new
    assert !organization.valid?
  end
end
