require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "can have a user" do
    organization = organizations(:one)
    user = users(:one)
    organization.users << user
    assert !organization.users.empty?
  end
end
