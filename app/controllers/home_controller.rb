class HomeController < ApplicationController
  def index
  	if !current_user
		redirect_to new_users_path
	else		
		render :index
	end
  end
end
