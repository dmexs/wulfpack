class UsersController < ApplicationController
  def new
  
  deviceId = "APA91bHq6N6zSUvF1u6dR2taCNRlrhEM-QDCi1pfoGlWuPwYJuZuADLsZtbad0yZuln9AYeI78NHpVXZgsJP6BlSwolnZqfDIsnU1anoIXbONaL-5ivKP6tAR7GbO0s-8tfRRSktoD8tkmC5SriRv1L6EMAjoTuICQ
"
 	  if device_params
  		deviceId = device_params
  	end

  	@user = User.new(:deviceId => deviceId.to_s)
  	if @user.save  		
  		session[:current_user]= @user.id  	   		
  		respond_to do |format|
			format.html { redirect_to root_path }			
			format.json { render :json => @user }
    	end			
  	else
  		flash[:failure] = "Oops something went wrong in users"    
  		 respond_to do |format|
			format.html 		
			format.json { render :json => {status:'error while saving user info'}.to_json}
    	end	
  	end
  end

  private
 	  def device_params
      params.permit(:deviceId)
    end
  
end
