class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:email] = @user.email
      login_to_jira(@user)
    else
      flash[:error] = "Incorrect email or password"
      render :new and return
    end
  end

end
