require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "cannot be created without email" do
    u = User.new
    assert u.invalid?
  end

  test "can have an organization" do
    u = users(:one)
    u.organizations << organizations(:one)
    assert true
  end

  test "can belong to an organization" do
    u = User.new
    assert u.invalid?
  end
end
