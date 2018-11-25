module SessionsHelper
	def login(user)
		session[:user_id] = user.id
	end

	def logout
		session[:user_id] = nil
	end

	def logged_in?
		!session[:user_id].nil?
	end

	def current_user
		if logged_in?
			@current_user ||= UserAccount.find_by(id: session[:user_id])
		end
	end
end
