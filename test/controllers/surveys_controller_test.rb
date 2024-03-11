require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get pre_test" do
    get surveys_pre_test_url
    assert_response :success
  end

  test "should get study_session" do
    get surveys_study_session_url
    assert_response :success
  end

  test "should get post_test" do
    get surveys_post_test_url
    assert_response :success
  end

  test "should get submit_pre_test" do
    get surveys_submit_pre_test_url
    assert_response :success
  end

  test "should get result_pre_test" do
    get surveys_result_pre_test_url
    assert_response :success
  end
end
