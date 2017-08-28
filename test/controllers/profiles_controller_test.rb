require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { bio: @profile.bio, birthday: @profile.birthday, display_name: @profile.display_name, facebook: @profile.facebook, hometown: @profile.hometown, instagram: @profile.instagram, phone_number: @profile.phone_number, snapchat: @profile.snapchat, user_id: @profile.user_id, website: @profile.website, whatsapp: @profile.whatsapp } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { bio: @profile.bio, birthday: @profile.birthday, display_name: @profile.display_name, facebook: @profile.facebook, hometown: @profile.hometown, instagram: @profile.instagram, phone_number: @profile.phone_number, snapchat: @profile.snapchat, user_id: @profile.user_id, website: @profile.website, whatsapp: @profile.whatsapp } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
