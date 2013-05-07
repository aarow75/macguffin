class Formats < ActiveRecord::Migration
  def up
  	change_table :movies do |t|
  		t.boolean :bluray
  		t.boolean :dvd
  		t.boolean :ultraviolet
  		t.boolean :apple
  	end
  end

  def down
  	remove_column :movies, :bluray
  	remove_column :movies, :dvd
  	remove_column :movies, :ultraviolet
  	remove_column :movies, :apple
  end
end
