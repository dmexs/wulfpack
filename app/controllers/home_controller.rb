class HomeController < ApplicationController
  def index
  	if !current_user
		redirect_to new_users_path
	else		
		respond_to do |format|
			format.html #index.html.erb
			format.json { render :json => current_user }
		end
	end
  end
end
