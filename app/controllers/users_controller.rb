class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:email] = @user.email
      login_to_jira(@user)
      redirect_to tickets_path
    else
      render :new and return
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :first_name, :last_name, :jira_username, :jira_password)
  end

end
