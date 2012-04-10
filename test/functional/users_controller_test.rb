require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context 'sign up' do
  
    should "show the new user page" do
      get :new
      assert assigns(:user)
      assert assigns(:user).new_record?
    end
    
    should "create a new user when given valid parameters" do
      post :create, user: { email: 'jane@company.com',
                            password: 'catsanddogs',
                            password_confirmation: 'catsanddogs' }
      assert_response :redirect
      assert_redirected_to root_path
      assert flash[:notice]
      
      # check that a user with the given email and password in the db
      user = User.find_by_email('jane@company.com')
      assert user
      assert user.authenticate('catsanddogs')
    end
    
    should "not create a user with invalid parameters" do
      post :create, user: {password: 'catsanddogs', password_confirmation: 'catsandogs'}
      assert_response :success
      assert_template :new
      assert assigns(:user)
      assert assigns(:user).invalid?
    end
  
  end

end
