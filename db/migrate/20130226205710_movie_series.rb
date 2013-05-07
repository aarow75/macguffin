class MovieSeries < ActiveRecord::Migration
  def up
  	change_table :movies do |t|
  		t.string :series
  	end
  end

  def down
  	remove_column :movie, :series
  end
end
