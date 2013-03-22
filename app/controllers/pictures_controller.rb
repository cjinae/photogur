class PicturesController < ApplicationController
	#before_filter :load_pictures #this will occcur before going into teach of the methods

	def index
		if params[:free] == "yes"
			@pictures = Picture.free.alphabetical.all
		else
			@pictures = Picture.alphabetical.all     	# this is what
		end
	end

	def show
		@picture = Picture.find params[:id]
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(params[:picture])	# instance of picture created in controller new, the parameters set in new.html.erb
		if @picture.save
			redirect_to pictures_path 			# pictures_path, this tells you to access the /pictures. alternative is :action => "index"

		else  #there was an error on the form
			flash.now[:error] = "Some fields are blank"
			render :new	
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		
		if @picture.update_attributes(params[:picture])
			redirect_to picture_path@picture.id 			# "/pictures/#{@picture.id}"
		else
			#something
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to pictures_path
	end

end




