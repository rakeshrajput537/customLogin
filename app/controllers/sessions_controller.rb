class SessionsController < ApplicationController
	def new
		
	end
	def create
		user = User.find_by(email:params[:login][:email].downcase)
		if user && user.authenticate(params[:login][:password])
			session[:user_id]=user.id.to_s
			redirect_to root_path, notice: 'successfully login!
			'
		else
			flash.now.alert = "Incorrect Email and password, try again."
			render :new
		end
	end
	def destroy
			session.delete(:user_id)
			redirct_to login_path, notice: "logged out"
			
	
		
	end
end
