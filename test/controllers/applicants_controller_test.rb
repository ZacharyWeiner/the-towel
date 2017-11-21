require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = applicants(:one)
  end

  test "should get index" do
    get applicants_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_url
    assert_response :success
  end

  test "should create applicant" do
    assert_difference('Applicant.count') do
      post applicants_url, params: { applicant: { best_project: @applicant.best_project, best_travel_experience: @applicant.best_travel_experience, company_name: @applicant.company_name, contact_method: @applicant.contact_method, current_city: @applicant.current_city, description: @applicant.description, email: @applicant.email, facebook: @applicant.facebook, favorite_city: @applicant.favorite_city, favorite_country: @applicant.favorite_country, instagram: @applicant.instagram, is_remote: @applicant.is_remote, is_traveling: @applicant.is_traveling, job_title: @applicant.job_title, linkedin: @applicant.linkedin, name: @applicant.name, phone: @applicant.phone, whatsapp: @applicant.whatsapp, why_me: @applicant.why_me, years_in_profession: @applicant.years_in_profession } }
    end

    assert_redirected_to applicant_url(Applicant.last)
  end

  test "should show applicant" do
    get applicant_url(@applicant)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_url(@applicant)
    assert_response :success
  end

  test "should update applicant" do
    patch applicant_url(@applicant), params: { applicant: { best_project: @applicant.best_project, best_travel_experience: @applicant.best_travel_experience, company_name: @applicant.company_name, contact_method: @applicant.contact_method, current_city: @applicant.current_city, description: @applicant.description, email: @applicant.email, facebook: @applicant.facebook, favorite_city: @applicant.favorite_city, favorite_country: @applicant.favorite_country, instagram: @applicant.instagram, is_remote: @applicant.is_remote, is_traveling: @applicant.is_traveling, job_title: @applicant.job_title, linkedin: @applicant.linkedin, name: @applicant.name, phone: @applicant.phone, whatsapp: @applicant.whatsapp, why_me: @applicant.why_me, years_in_profession: @applicant.years_in_profession } }
    assert_redirected_to applicant_url(@applicant)
  end

  test "should destroy applicant" do
    assert_difference('Applicant.count', -1) do
      delete applicant_url(@applicant)
    end

    assert_redirected_to applicants_url
  end
end
