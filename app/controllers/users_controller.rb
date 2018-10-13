class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@user.email.downcase!

		if @user.save
			flash[:notice] ="Account created succesfully!"
			redirect_to root_path
		else
			flash.now.alert ="Oops , couldn't create Account. please make sure your are using a valid email."
			render :new
		end
		
	end
	private
	def user_params
		params.require(:user).permit(:name, :email,:password,:password_confirmation)
	end
end
