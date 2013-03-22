class Picture < ActiveRecord::Base
# include Magic!! In the pictures database that was created there is title, artist
# and url. Rails knows that when Picture class is callsed it is looking 
# for the Pictures table (which is in the CreatePictures Class)

	# Allow mass-assignment for the attributes titles and artist
	attr_accessible :title, :artist, :url
	# Don't confuse this with attr_accessor!!!

	validates :title, :presence => true
	validates :url, :presence => true
	validates :artist, :presence => true



end


# purpose of having attr_accessible is primarily for security. 
# it controls things like user_accessible which is a mass change function that 
# permits user to make changes to all data. 
# by excluding the :admin from attr_accessible, you are preventing them from
# adding themselves as an admin and makign mass [global] changes
