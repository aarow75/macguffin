class UserRating < ActiveRecord::Migration
  def up
  	change_table :movies do |t|
  		t.string :rating
  	end
  end

  def down
  	remove_column :movies, :rating
  end
end
