class UserAccountController < ApplicationController

	## GET /signup
	def new
		@user = UserAccount.new
	end

	## POST /signup
	def create
	end

	private

	def signup_params
		params.require(:user_account).permit(:username, :password, :first_name, :last_name)
	end
end
