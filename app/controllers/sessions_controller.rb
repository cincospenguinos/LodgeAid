class SessionsController < ApplicationController
	include SessionsHelper

  def new
  end

  def create
  	user = UserAccount.find_by(username: sessions_params[:username].downcase)

  	if user && user.authenticate(sessions_params[:password])
  		login(user)
  		redirect_to root_path # TODO: Redirect to user 
  	else
  		flash.now[:danger] = 'Invalid username or password'
  		render 'new'
  	end
  end

  def destroy
  end

  private

  def sessions_params
  	params.require(:session).permit(:username, :password)
  end
end
