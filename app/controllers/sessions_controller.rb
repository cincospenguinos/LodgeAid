class SessionsController < ApplicationController
	include SessionsHelper

  ## GET /login
  def new
  end

  ## GET /dashboard
  def show
    @user = current_user
  end

  ## POST /login
  def create
  	user = UserAccount.find_by(username: sessions_params[:username].downcase)

  	if user && user.authenticate(sessions_params[:password])
  		login(user)
  		redirect_to dashboard_path
  	else
  		flash.now[:danger] = 'Invalid username or password'
  		render 'new'
  	end
  end

  ## DELETE /logout
  def destroy
  end

  private

  def sessions_params
  	params.require(:session).permit(:username, :password)
  end
end
