require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  context "login" do

    setup do
      @user = Factory(:user)
    end

    should "show the login page" do
      get :new
      assert_response :success
    end

    should "login when given correct credentials" do
      post :create, email: @user.email, password: "infopass"
      assert_response :redirect
      assert_redirected_to root_path
      assert session[:user_id]
    end

    should "not login with a non-existing user" do
      post :create, email: "no.such@user.com", password: "huh"
      assert_response :success
      assert_template :new
      assert session[:user_id].nil?
    end
    
  end # context "login"

  context "logout" do

    setup do
      session[:user_id] = Factory(:user).id
    end

    should "log out" do
      delete :destroy
      assert_response :redirect
      assert_redirected_to new_session_path
      assert session[:user_id].nil?
    end

  end # context "logout"

  context "current user" do

    setup do
      @user = Factory(:user)
    end

    should "return the logged-in user when user is logged in" do
      session[:user_id] = @user.id
      assert_equal @controller.send(:current_user), @user
    end

    should "return nil when not logged in" do
      assert @controller.send(:current_user).nil?
    end

  end # context "current user"

end
