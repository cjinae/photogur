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
		@picture = Picture.create(params[:picture])	# instance of picture created in controller new, the parameters set in new.html.erb

		# success = Picture.create(params)
		if success
			redirect_to :action => "index" 			# pictures_path, this tells you to access the /pictures
		end
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	def update
		@picture = Picture.find(params[:id])
		# @picture.admin = true
		# @picture.update_attributes :admin => true
		# # params = {:admin => true}
		# @picture.update_attributes params   	# this would not work because we didn't give attr_accessible

		if @picture.update_attributes(:artist => params[:artist],:title => params[:title], :url => params[:url])
			redirect_to :action => "show", :id => params[:id]
		end
	end

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

end	

