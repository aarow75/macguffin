class RemoveUnusedColumns < ActiveRecord::Migration
  def up
    remove_column :movies, :format
    remove_column :movies, :production_designer
  end

  def down
    # not adding anything back since our code hasn't been using these fields
  end
end
