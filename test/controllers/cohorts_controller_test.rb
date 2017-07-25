require 'test_helper'

class CohortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cohort = cohorts(:one)
  end

  test "should get index" do
    get cohorts_url
    assert_response :success
  end

  test "should get new" do
    get new_cohort_url
    assert_response :success
  end

  test "should create cohort" do
    assert_difference('Cohort.count') do
      post cohorts_url, params: { cohort: { banner_image: @cohort.banner_image, description: @cohort.description, end_date: @cohort.end_date, image: @cohort.image, name: @cohort.name, start_date: @cohort.start_date } }
    end

    assert_redirected_to cohort_url(Cohort.last)
  end

  test "should show cohort" do
    get cohort_url(@cohort)
    assert_response :success
  end

  test "should get edit" do
    get edit_cohort_url(@cohort)
    assert_response :success
  end

  test "should update cohort" do
    patch cohort_url(@cohort), params: { cohort: { banner_image: @cohort.banner_image, description: @cohort.description, end_date: @cohort.end_date, image: @cohort.image, name: @cohort.name, start_date: @cohort.start_date } }
    assert_redirected_to cohort_url(@cohort)
  end

  test "should destroy cohort" do
    assert_difference('Cohort.count', -1) do
      delete cohort_url(@cohort)
    end

    assert_redirected_to cohorts_url
  end
end
