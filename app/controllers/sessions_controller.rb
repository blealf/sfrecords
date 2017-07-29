class SessionsController < ApplicationController
  def new
  end

  def create

  	user = User.find_by(email: params[:session][:value].downcase) || User.find_by(username: params[:session][:value].downcase)
  	
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
  		redirect_to root_url
  	else
  		flash.now[:danger] = 'Invalid email or username/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
