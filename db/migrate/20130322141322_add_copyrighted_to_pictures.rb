class AddCopyrightedToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :copyrighted, :boolean, 


  	Picture.all.each do |picture|
  		picture.copyrighted = true
  		picture.save! 
  	end

  end
end
