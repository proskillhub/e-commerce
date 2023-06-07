require "test_helper"

class Admin::SubcategorysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_subcategorys_index_url
    assert_response :success
  end
end
