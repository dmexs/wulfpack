require 'rubygems'
require 'pushmeup'

class HowlsController < ApplicationController
  
  def new
  		deviceId = 'APA91bHq6N6zSUvF1u6dR2taCNRlrhEM-QDCi1pfoGlWuPwYJuZuADLsZtbad0yZuln9AYeI78NHpVXZgsJP6BlSwolnZqfDIsnU1anoIXbONaL-5ivKP6tAR7GbO0s-8tfRRSktoD8tkmC5SriRv1L6EMAjoTuICQ
'

	  	GCM.host = 'https://android.googleapis.com/gcm/send'
	    # https://android.googleapis.com/gcm/send is default

	    GCM.format = :json
	    # :json is default and only available at the moment

	    GCM.key = "AIzaSyAN-U-gEEPL0HzC4st2czQUc86jnnbN6fo"
	    # this is the apiKey obtained from here https://code.google.com/apis/console/

	  	destination = [deviceId]
	    # can be an string or an array of strings containing the regIds of the devices you want to send

		data = {:message => "wulfpack message --- hawwoooooo", :msgcnt => "1"}

	    #data = {:key => "value", :key2 => ["array", "value"]}
	    # must be an hash with all values you want inside you notification

	    GCM.send_notification( destination )
	    # Empty notification

	    GCM.send_notification( destination, data )
	    # Notification with custom information

	    GCM.send_notification( destination, data, :collapse_key => "placar_score_global", :time_to_live => 3600, :delay_while_idle => false )
	    # Notification with custom information and parameters  	
  end
end
