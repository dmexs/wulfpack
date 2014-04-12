class UsersController < ApplicationController
  def new
  	@user = User.new(:deviceId => "1233")
  	if @user.save  		
  		session[:current_user]= @user.id  	 
  		redirect_to root_path 		
  	else
  		flash[:failure] = "Oops something went wrong in users"      		
  	end
  end
end
