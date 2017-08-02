class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:value].downcase) || User.find_by(username: params[:session][:value].downcase)
  	
  	if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user, :notice => "Logged in!"
  	else
  		flash.now[:danger] = 'Invalid email or username/password combination'
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
  	redirect_to root_url, :notice => "Logged out!"
  end
end


# def create

#   user = User.find_by(email: params[:session][:value].downcase) || User.find_by(username: params[:session][:value].downcase)
  
#   if user && user.authenticate(params[:session][:password])
#     log_in(user)
#     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
#     redirect_to root_url, :notice => "Logged in!"
#   else
#     flash.now[:danger] = 'Invalid email or username/password combination'
#     render 'new'
#   end
# end