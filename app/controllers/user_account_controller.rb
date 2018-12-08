class UserAccountController < ApplicationController

	## GET /signup
	def new
		@user = UserAccount.new
	end

	## POST /signup
	def create
		@mason = Mason.find_by(membership_number: signup_params[:membership_number])
		@user = UserAccount.new(username: signup_params[:username], password: signup_params[:password],
				password_confirmation: signup_params[:password_confirmation], mason: @mason)

		if @user.save
			# TODO: Show something better here
			redirect_to root_path, notice: 'Account created! You will be notified when someone accepts.'
		else
			render 'new'
		end
	end

	private

	def signup_params
		params.require(:user_account).permit(:username, :password, :membership_number, :password_confirmation)
	end
end
