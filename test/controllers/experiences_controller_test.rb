require 'test_helper'

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get experiences_indexshow_url
    assert_response :success
  end

end
