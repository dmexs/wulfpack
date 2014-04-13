class CourtsController < ApplicationController
	def index
		@courts = Court.all
	end

  	def show
		@court = Court.find_by_id(params[:id])
	end

	def edit
		@court = Court.find_by_id(params[:id])
	end

	def new
		@court = Court.new
	end
	
	def create
		@court = Court.new(court_params)

		if @court.save			
	        respond_to do |format|
	  			format.html {  redirect_to courts_path @court }			
	  			format.json { render :json => @court }
	    	end	
		else			
			respond_to do |format|
	  			format.html {  redirect_to courts_path @court }			
	  			format.json { render :json => {status:'error while saving court info'}.to_json}
	    	end	
		end
	end

	private
		def court_params
			params.require(:court).permit(:id, :name, :longitude, :latitude)
		end
	 	
end
