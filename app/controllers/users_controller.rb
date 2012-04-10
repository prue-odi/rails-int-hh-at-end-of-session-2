class UsersController < ApplicationController

  skip_before_filter :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Welcome, new user!"
      redirect_to root_path
    else
      render action: :new
    end
  end
  
end
