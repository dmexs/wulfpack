require 'rubygems'
require 'pushmeup'

class HowlsController < ApplicationController

	def index
		@howls = Howl.all.where('user_id = ? and created_at > ?', current_user.id, 60.minutes.ago)
	end

	def new
		@howl = Howl.new
	end

	def create
		@howl = Howl.new(howl_params)

		if @howl.save		
			submit	
	        respond_to do |format|
	  			format.html {  redirect_to howls_path @howl }			
	  			format.json { render :json => @howl }
	    	end	
		else			
			respond_to do |format|
	  			format.html {  redirect_to howls_path @howl }			
	  			format.json { render :json => {status:'error while saving howl info'}.to_json}
	    	end	
		end
	end
  
  private 
  	def submit
  		deviceId = current_user.deviceId

	  	GCM.host = 'https://android.googleapis.com/gcm/send'
	    # https://android.googleapis.com/gcm/send is default

	    GCM.format = :json
	    # :json is default and only available at the moment

	    GCM.key = "AIzaSyAN-U-gEEPL0HzC4st2czQUc86jnnbN6fo"
	    # this is the apiKey obtained from here https://code.google.com/apis/console/

	  	destination = [deviceId]
	    # can be an string or an array of strings containing the regIds of the devices you want to send

		data = {:message => "wulfpack message --- hawwoooooo"}

	    #data = {:key => "value", :key2 => ["array", "value"]}
	    # must be an hash with all values you want inside you notification

	    GCM.send_notification( destination )
	    # Empty notification

	    GCM.send_notification( destination, data )
	    # Notification with custom information

	    GCM.send_notification( destination, data, :collapse_key => "placar_score_global", :time_to_live => 3600, :delay_while_idle => false )
	    # Notification with custom information and parameters  	
  	end


  	def howl_params
  		params.require(:howl).permit(:court_id, :user_id)
  	end
end
