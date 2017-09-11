class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      session[:email] = @user.email
      login_to_jira(@user)
      current_user.currently_logged_in = true
      current_user.save
      redirect_to tickets_path
    else
      @user = User.new
      flash[:error] = "Incorrect email or password"
      render :new and return
    end
  end

  def destroy
    current_user.currently_logged_in = false
    current_user.save
    session[:email] = nil
    redirect_to :new and return
  end

end
