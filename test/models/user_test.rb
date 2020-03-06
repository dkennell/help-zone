require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user cannot be created without email" do
    u = User.new
    assert u.invalid?
  end
end
