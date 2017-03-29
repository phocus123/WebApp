class SessionsController < ApplicationController
  def new
  end
  
  def create
	user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			if user[:is_admin]
				log_in user
				redirect_to user
			else
				log_in user
				redirect_to user
			end
		else
		flash.now[:notice] = 'Invalid email/password combination!' 
		render 'new'
		end
  end
  
  def destroy
  	log_out
 	redirect_to root_url
  end
end
