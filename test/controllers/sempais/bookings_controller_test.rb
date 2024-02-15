require "test_helper"

class Sempais::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sempais_bookings_index_url
    assert_response :success
  end
end
