require 'test_helper'

class ContactSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_submission = contact_submissions(:one)
  end

  test "should get index" do
    get contact_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_submission_url
    assert_response :success
  end

  test "should create contact_submission" do
    assert_difference('ContactSubmission.count') do
      post contact_submissions_url, params: { contact_submission: { email: @contact_submission.email, message: @contact_submission.message, name: @contact_submission.name } }
    end

    assert_redirected_to contact_submission_url(ContactSubmission.last)
  end

  test "should show contact_submission" do
    get contact_submission_url(@contact_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_submission_url(@contact_submission)
    assert_response :success
  end

  test "should update contact_submission" do
    patch contact_submission_url(@contact_submission), params: { contact_submission: { email: @contact_submission.email, message: @contact_submission.message, name: @contact_submission.name } }
    assert_redirected_to contact_submission_url(@contact_submission)
  end

  test "should destroy contact_submission" do
    assert_difference('ContactSubmission.count', -1) do
      delete contact_submission_url(@contact_submission)
    end

    assert_redirected_to contact_submissions_url
  end
end
