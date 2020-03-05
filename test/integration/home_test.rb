require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test "home page load" do
    get "/"
    assert_select "p", "Boop!"
  end
end
