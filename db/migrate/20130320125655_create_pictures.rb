class CreatePictures < ActiveRecord::Migration
  
	# rake db:migrate
  def up
  	create_table :pictures do |t|
  		t.string :artist
  		t.string :title
  		t.string :url
  		# t.boolean :admin, false
  		# t.strong :comment
  	end
  end

  # rake db:rollback
  def down
  	drop_table :pictures
  end
end
