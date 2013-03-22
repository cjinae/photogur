class PicturesController < ApplicationController
	#before_filter :load_pictures #this will occcur before going into teach of the methods

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find params[:id]
	end

	def new
		@picture = Picture.new
	end

	def create
		# @picture = Picture.new
		# @picture.url = params[:url]				# this is setting 3 parameters/attributes to @picture
		# @picture.title = params[:title]			# the names of the key are set up in the new.html POST method
		# @picture.artist = params[:artist]
		# success = @picture.save		
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
end

		# Old Update Method 1:
			# @picture.admin = true
			# @picture.update_attributes :admin => true
			# # params = {:admin => true}
			# @picture.update_attributes params   	# this would not work because we didn't give attr_accessible
		# Old Update Method 2:
			# success = @picture.update_attributes(
			# 	:artist => params[:artist],
			# 	:title => params[:title],
			# 	:url => params[:url]
			# 	)
			# if success
			# 	redirect_to :action => "show", :id => params[:id]
			# end

	# def load_pictures
		

		# @pictures = [
		# 	      {
		# 	        :title  => "The old church on the coast of White sea",
		# 	        :artist => "Sergey Ershov",
		# 	        :url    => "http://monicao.s3.amazonaws.com/bitmaker/house.jpg"
		# 	      },
		# 	      {
		# 	        :title  => "Sea Power",
		# 	        :artist => "Stephen Scullion",
		# 	        :url    => "http://monicao.s3.amazonaws.com/bitmaker/wave.jpg"
		# 	      },
		# 	      {
		# 	        :title  => "Into the Poppies",
		# 	        :artist => "John Wilhelm",
		# 	        :url    => "http://monicao.s3.amazonaws.com/bitmaker/girl.jpg"
		# 	      }
		# 	    ]
	# end



