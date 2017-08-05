class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

	def authorize
	  unless User.find_by(id: session[:user_id])
	    redirect_to login_url, notice: "Please log in"
	  end
	end

	# def admin_user
	#   unless User.find_by(id: session[:user_id])
	#     redirect_to login_url, notice: "Please log in"
	#   end
	# end

	def admin?
			if logged_in?
				User.find_by(id: session[:user_id]).role == 'admin'
			end

	end

	def admin_user
		unless admin?
			redirect_to login_url, notice: "Admin priviledges needed"
	  end
	end

	# current user from cache
	# def current_user
	#   @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
	# end
end
