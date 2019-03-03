require 'test_helper'

class Initiatives::CommitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get initiatives_commitments_new_url
    assert_response :success
  end

  test "should get create" do
    get initiatives_commitments_create_url
    assert_response :success
  end

end
