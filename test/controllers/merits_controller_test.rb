require 'test_helper'

class MeritsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merit = merits(:one)
  end

  test "should get index" do
    get merits_url
    assert_response :success
  end

  test "should get new" do
    get new_merit_url
    assert_response :success
  end

  test "should create merit" do
    assert_difference('Merit.count') do
      post merits_url, params: { merit: { name: @merit.name } }
    end

    assert_redirected_to merit_url(Merit.last)
  end

  test "should show merit" do
    get merit_url(@merit)
    assert_response :success
  end

  test "should get edit" do
    get edit_merit_url(@merit)
    assert_response :success
  end

  test "should update merit" do
    patch merit_url(@merit), params: { merit: { name: @merit.name } }
    assert_redirected_to merit_url(@merit)
  end

  test "should destroy merit" do
    assert_difference('Merit.count', -1) do
      delete merit_url(@merit)
    end

    assert_redirected_to merits_url
  end
end
