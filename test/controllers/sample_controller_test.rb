require 'test_helper'

class SampleControllerTest < ActionDispatch::IntegrationTest
  test "should get starter" do
    get sample_starter_url
    assert_response :success
  end

end
