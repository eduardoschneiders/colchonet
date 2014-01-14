class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
      
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user,
	          notice: 'User created'
    else
      render action: :new
    end
  end

  private

  def user_params
    params.
      require(:user).
      permit(:email, :full_name, :location, :password, :password_confirmation, :bio)
  end	     
end
